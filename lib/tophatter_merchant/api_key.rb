module TophatterMerchant
  class ApiKey < Resource

    attr_accessor :id, :access_token

    class << self

      def schema
        get(url: "#{path}/schema.json")
      end

      def all
        response = get(url: "#{path}.json")
        response.map { |hash| ApiKey.new(hash) }
      end

      def retrieve(id)
        ApiKey.new get(url: "#{path}/#{id}.json")
      end

      def create
        ApiKey.new post(url: "#{path}.json")
      end

      def destroy(id)
        response = delete(url: "#{path}/#{id}.json")
        response.map { |hash| ApiKey.new(hash) }
      end

      protected

      def path
        super + '/api_keys'
      end

    end
  end
end
