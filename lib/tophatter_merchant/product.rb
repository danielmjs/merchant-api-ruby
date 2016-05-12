module TophatterMerchant
  class Product < Resource

    attr_accessor :identifier
    attr_accessor :title, :description, :product_condition
    attr_accessor :product_category
    attr_accessor :product_variations
    # attr_accessor :product_brand, :product_model
    attr_accessor :minimum_bid_amount, :buy_now_price, :retail_price, :shipping_price, :shipping_price_other
    attr_accessor :ships_from, :estimated_days_to_ship, :estimated_days_to_deliver
    attr_accessor :primary_image, :extra_images
    attr_accessor :disabled

    def id
      identifier
    end

    def root_category
      product_category.to_s.split(' | ').first
    end

    def fill!
      self.title = 'Foo'
      self.description = 'Bar'
      self.product_condition = 'New'
      self.product_category = 'Other | Other'
      self.minimum_bid_amount = 1
      self.buy_now_price = 10
      self.retail_price = 20
      self.shipping_price = 3
      self.shipping_price_other = 10
      self.ships_from = 'China'
      self.estimated_days_to_ship = 3
      self.estimated_days_to_deliver = 10
      self.product_variations = [
        { size: nil, color: 'Red', identifier: 'FOOBAR-R', quantity: 10 }.with_indifferent_access,
        { size: nil, color: 'Blue', identifier: 'FOOBAR-B', quantity: 10 }.with_indifferent_access,
        { size: nil, color: 'Pink', identifier: 'FOOBAR-P', quantity: 10 }.with_indifferent_access
      ]
      self.primary_image = 'https://img0.etsystatic.com/101/0/7856452/il_fullxfull.882030160_r0tn.jpg'
      self.extra_images = ['https://img1.etsystatic.com/104/0/7856452/il_fullxfull.881791367_26vj.jpg']
      self
    end

    class << self

      # ap TophatterMerchant::Product.schema
      def schema
        get(url: "#{path}/schema.json")
      end

      # ap TophatterMerchant::Product.all.map(&:to_h)
      def all(page: 1, per_page: 50)
        get(url: "#{path}.json", params: { page: page, per_page: per_page }).map do |hash|
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
