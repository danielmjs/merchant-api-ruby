module TophatterMerchant
  class Image < Resource

    def self.create(file)
      Hashie::Mash.new post(url: "#{path}.json", params: { data: file })
    end

    protected

    def self.path
      super + '/images'
    end

  end
end
