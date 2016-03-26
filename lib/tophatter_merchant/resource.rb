module TophatterMerchant
  class Resource

    include ActiveModel::Model
    extend ActiveModel::Naming

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
        payload = params.merge(access_token: TophatterMerchant.access_token)
        # raise Exception, payload[:product_variations].inspect
        RestClient::Request.new(method: method, url: url, payload: payload, accept: :json)
      end

      def path
        TophatterMerchant.api_path
      end
    end
  end
end
