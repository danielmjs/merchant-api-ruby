module TophatterMerchant
  class ProductVariation < Resource

    def self.schema
      get(url: "#{path}/schema.json")
    end

    def self.retrieve(id)
      get(url: "#{path}/retrieve.json", params: { unique_id: id })
    end

    def self.create(data)
      post(url: "#{path}.json", params: data)
    end

    def self.update(id, data)
      post(url: "#{path}/update.json", params: data.merge(unique_id: id))
    end

    protected

    def self.path
      super + '/variations'
    end

  end
end
