module TophatterMerchant
  class Product < Resource

    def self.schema
      get(url: "#{path}/schema.json").map do |hash|
        Hashie::Mash.new hash
      end
    end

    def self.all(page: 1, per_page: 50)
      get(url: "#{path}.json", params: { page: page, per_page: per_page }).map do |hash|
        Hashie::Mash.new hash
      end
    end

    def self.retrieve(id)
      Hashie::Mash.new get(url: "#{path}/retrieve.json", params: { user_product_id: id })
    end

    def self.create(data)
      Hashie::Mash.new post(url: "#{path}.json", params: data)
    end

    def self.update(id, data)
      Hashie::Mash.new post(url: "#{path}/update.json", params: data.merge(user_product_id: id))
    end

    def self.upload(file)
      Hashie::Mash.new post(url: "#{path}/upload.json", params: { data: file })
    end

    protected

    def self.path
      super + '/products'
    end

  end
end
