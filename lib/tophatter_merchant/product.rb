module TophatterMerchant
  class Product < Resource

    attr_accessor :identifier
    attr_accessor :title, :description, :product_condition
    attr_accessor :product_category
    attr_accessor :product_variations
    attr_accessor :minimum_bid_amount, :buy_now_price, :retail_price, :shipping_price
    attr_accessor :ships_from, :estimated_days_to_ship, :estimated_days_to_deliver
    attr_accessor :primary_image, :extra_images, :all_images
    attr_accessor :created_at, :disabled_at

    def id
      created_at.present? ? identifier : nil
    end

    def sizes(available)
      if product_category.present?
        taxonomy = product_category.to_s.split(' | ')
        taxonomy.reverse.each do |key|
          return available[key] if available[key].present?
        end
        []
      else
        []
      end
    end

    def images(size: 'square')
      if persisted?
        all_images.collect { |image| image['square'] }
      else
        ([primary_image] + extra_images.to_s.split('|')).compact
      end
    end

    class << self

      # ap TophatterMerchant::Product.schema
      def schema
        get(url: "#{path}/schema.json")
      end

      # ap TophatterMerchant::Product.all.map(&:to_h)
      def all(page: 1, per_page: 50, status: nil)
        get(url: "#{path}.json", params: { page: page, per_page: per_page, status: status }).map do |hash|
          Product.new(hash)
        end
      end

      def retrieve(id)
        Product.new get(url: "#{path}/retrieve.json", params: { identifier: id })
      end

      # ap TophatterMerchant::Product.create(TophatterMerchant::Product.new({}).fill!.to_h).to_h
      def create(data)
        Product.new post(url: "#{path}.json", params: data)
      end

      # ap TophatterMerchant::Product.update('FOOBAR', buy_now_price: 11).to_h
      def update(id, data)
        Product.new post(url: "#{path}/update.json", params: data.merge(identifier: id))
      end

      # ap TophatterMerchant::Product.disable('FOOBAR').to_h
      def disable(id)
        Product.new post(url: "#{path}/disable.json", params: { identifier: id })
      end

      # ap TophatterMerchant::Product.enable('FOOBAR').to_h
      def enable(id)
        Product.new post(url: "#{path}/enable.json", params: { identifier: id })
      end

      protected

      def path
        super + '/products'
      end

    end
  end
end
