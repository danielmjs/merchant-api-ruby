module TophatterMerchant
  class Variation < Resource

    attr_accessor :unique_id, :size, :color, :quantity

    class << self

      # ap TophatterMerchant::Variation.schema
      def schema
        get(url: "#{path}/schema.json")
      end

      # ap TophatterMerchant::Variation.retrieve('FOOBAR-R').to_h
      def retrieve(unique_id)
        Variation.new get(url: "#{path}/retrieve.json", params: { unique_id: unique_id })
      end

      def create(params)
        post(url: "#{path}.json", params: params).map do |hash|
          Variation.new(hash)
        end
      end

      # ap TophatterMerchant::Variation.update('FOOBAR-R', quantity: 100).to_h
      def update(unique_id, data)
        Variation.new post(url: "#{path}/update.json", params: data.merge(unique_id: unique_id))
      end

      protected

      def path
        super + '/variations'
      end

    end

  end
end
