module TophatterMerchant
  class Product < Resource

    def self.schema
      get(url: "#{path}/schema.json")
    end

    def self.all(page: 1, per_page: 50)
      get(url: "#{path}.json", params: { page: page, per_page: per_page })
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

    def self.upload(file)
      post(url: "#{path}/upload.json", params: { data: file })
    end

    protected

    def self.path
      super + '/products'
    end

  end
end
