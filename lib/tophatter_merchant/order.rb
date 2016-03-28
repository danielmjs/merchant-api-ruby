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

    def self.retrieve(id)
      Hashie::Mash.new get(url: "#{path}/#{id}/retrieve.json")
    end

    def self.fulfill(id: nil, tracking_number: nil, tracking_type: nil, shipped_at: nil)
      post(url: "#{path}/#{id}/fulfill.json", params: { tracking_number: tracking_number, tracking_type: tracking_type, shipped_at: shipped_at })
    end

    def self.unfulfill(id)
      post(url: "#{path}/#{id}/unfulfill.json")
    end

    protected

    def self.path
      super + '/orders'
    end

  end
end
