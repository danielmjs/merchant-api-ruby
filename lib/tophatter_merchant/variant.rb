module TophatterMerchant
  class Variant < Resource

    def self.schema
      Hashie::Mash.new get(url: "#{path}/schema.json")
    end

    protected

    def self.path
      super + '/variants'
    end

  end
end
