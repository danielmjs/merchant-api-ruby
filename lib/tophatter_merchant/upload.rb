module TophatterMerchant
  class Upload < Resource

    def self.all(page: 1, per_page: 50)
      get(url: "#{path}.json", params: { page: page, per_page: per_page })
    end

    def self.retrieve(id)
      get(url: "#{path}/retrieve.json", params: { upload_id: id })
    end

    protected

    def self.path
      super + '/uploads'
    end

  end
end
