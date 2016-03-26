module TophatterMerchant
  class ProductVariation < Resource

    attr_accessor :unique_id, :size, :color, :quantity

    class << self

      def schema
        get(url: "#{path}/schema.json")
      end

      def retrieve(unique_id)
        get(url: "#{path}/retrieve.json", params: { unique_id: unique_id })
      end

      def create(params)
        post(url: "#{path}.json", params: params)
      end

      def update(unique_id, data)
        post(url: "#{path}/update.json", params: params.merge(unique_id: unique_id))
      end

      protected

      def path
        super + '/variations'
      end

    end

  end
end
