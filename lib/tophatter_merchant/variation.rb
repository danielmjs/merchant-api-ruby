module TophatterMerchant
  class Variation < Resource

    attr_accessor :identifier, :size, :color, :quantity

    def id
      identifier
    end

    class << self

      # ap TophatterMerchant::Variation.schema
      def schema
        get(url: "#{path}/schema.json")
      end

      # ap TophatterMerchant::Variation.retrieve('FOOBAR-R').to_h
      def retrieve(identifier)
        Variation.new get(url: "#{path}/retrieve.json", params: { identifier: identifier })
      end

      def create(params)
        post(url: "#{path}.json", params: params).map do |hash|
          Variation.new(hash)
        end
      end

      # ap TophatterMerchant::Variation.update('FOOBAR-R', quantity: 100).to_h
      def update(identifier, data)
        Variation.new post(url: "#{path}/update.json", params: data.merge(identifier: identifier))
      end

      protected

      def path
        super + '/variations'
      end

    end

  end
end
