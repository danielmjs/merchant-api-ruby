require 'active_model'
require 'uri'

module TophatterMerchant
  class Resource

    include ActiveModel::Model

    def self.attr_accessor(*vars)
      attributes!(*vars)
      super(*vars)
    end

    def initialize(hash)
      self.attributes = hash
    end

    def attributes=(hash)
      hash.each do |key, value|
        if respond_to?(key)
          self.class.attributes!(key)
          send("#{key}=", value)
        end
      end
    end

    def attributes
      self.class.attributes
    end

    def to_h
      attributes.collect { |key| [key, send(key)] }.compact.to_h
    end

    def persisted?
      id.present?
    end

    private

    def self.attributes
      @attributes || []
    end

    def self.attributes!(*vars)
      @attributes ||= []
      @attributes.concat(vars.map(&:to_s))
    end

    class << self

      protected

      def get(url:, params: {})
        execute request(method: :get, url: url, params: params)
      end

      def post(url:, params: {})
        execute request(method: :post, url: url, params: params)
      end

      def put(url:, params: {})
        execute request(method: :put, url: url, params: params)
      end

      def delete(url:, params: {})
        execute request(method: :delete, url: url, params: params)
      end

      def execute(request)
        binding.pry
        begin
          puts "#{request.method.upcase} #{request.url} #{request.payload.inspect}"
          response = request.execute
          raise BadContentTypeException.new, "The server didn't return JSON. You probably made a bad request." if response.headers[:content_type] == 'text/html; charset=utf-8'
          JSON.parse(response.body)
        rescue RestClient::Request::Unauthorized => e
          error = begin
            JSON.parse(e.response)
          rescue
            {}
          end
          raise UnauthorizedException.new, error['message']
        rescue RestClient::BadRequest => e
          error = begin
            JSON.parse(e.response)
          rescue
            {}
          end
          raise BadRequestException.new, error['message']
        rescue RestClient::ResourceNotFound
          raise NotFoundException.new, 'The API path you requested does not exist.'
        rescue RestClient::InternalServerError
          raise ServerErrorException.new, 'The server encountered an internal error. This is probably a bug, and you should contact support.'
        end
      end

      def request(method:, url:, params:)
        payload = if TophatterMerchant.access_token.present?
          params.merge(access_token: TophatterMerchant.access_token)
        else
          params
        end

        RestClient::Request.new(method: method, url: url, payload: payload, accept: :json)
      end

      def path
        full_path = if TophatterMerchant.api_locale.present?
          uri = URI.parse(TophatterMerchant.api_path)
          path = uri.path
          uri.path = "/#{TophatterMerchant.api_locale.to_s}#{path}"
          uri.to_s
        else
          TophatterMerchant.api_path
        end
      end

    end
  end
end
