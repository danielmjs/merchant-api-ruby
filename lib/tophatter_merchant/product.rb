module TophatterMerchant
  class Product < Resource

    attr_accessor :unique_id
    attr_accessor :title, :description, :product_condition
    attr_accessor :product_category
    attr_accessor :product_variations
    # attr_accessor :product_brand, :product_model
    attr_accessor :minimum_bid_amount, :buy_now_price, :retail_price, :shipping_price, :shipping_price_other
    attr_accessor :ships_from, :estimated_days_to_ship, :estimated_days_to_deliver
    attr_accessor :primary_image, :extra_images

    def product_variations=(array)
      # https://github.com/rest-client/rest-client/issues/59
      if array.is_a?(Hash)
        @product_variations = array
      elsif array.is_a?(Array)
        @product_variations = (0..array.length - 1).zip(array).to_h
      end
    end

    def id
      unique_id
    end

    def root_category
      product_category.split(' | ').first
    end

    def stored=(boolean)
      @stored = boolean
    end

    def stored
      @stored
    end

    def persisted?
      stored.present?
    end

    def fill!
      self.unique_id = 'FOOBAR'
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
      self.product_variations = {
        '0': { size: nil, color: 'Red', unique_id: 'FOOBAR-R', quantity: 10 }.with_indifferent_access,
        '1': { size: nil, color: 'Blue', unique_id: 'FOOBAR-B', quantity: 10 }.with_indifferent_access,
        '2': { size: nil, color: 'Pink', unique_id: 'FOOBAR-P', quantity: 10 }.with_indifferent_access
      }
    end

    class << self
      def schema
        get(url: "#{path}/schema.json")
      end

      def all(page: 1, per_page: 50)
        get(url: "#{path}.json", params: { page: page, per_page: per_page })
      end

      def retrieve(id)
        get(url: "#{path}/retrieve.json", params: { unique_id: id })
      end

      def create(data)
        post(url: "#{path}.json", params: data)
      end

      def update(id, data)
        post(url: "#{path}/update.json", params: data.merge(unique_id: id))
      end

      def upload(file)
        post(url: "#{path}/upload.json", params: { data: file })
      end

      protected

      def path
        super + '/products'
      end
    end
  end
end
