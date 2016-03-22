module TophatterMerchant
  class Order < Resource

    def self.schema
      Hashie::Mash.new get(url: "#{path}/schema.json")
    end

    def self.all(filter: 'all', page: 1, per_page: 50)
      get(url: "#{path}.json", params: { filter: filter, page: page, per_page: per_page }).map do |hash|
        Hashie::Mash.new hash
      end
    end

    protected

    def self.path
      super + '/orders'
    end

  end
end
