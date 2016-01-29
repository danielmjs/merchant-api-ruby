module TophatterMerchant
  class Order < Resource

    def self.schema
      Hashie::Mash.new get(url: "#{path}/schema.json")
    end

    protected

    def self.path
      super + '/orders'
    end

  end
end
