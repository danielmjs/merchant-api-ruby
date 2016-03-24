module TophatterMerchant
  class Metadata < Resource

    def self.conditions
      get(url: "#{path}/conditions.json")
    end

    def self.categories
      get(url: "#{path}/categories.json")
    end

    def self.sizes
      get(url: "#{path}/sizes.json")
    end

    def self.countries
      get(url: "#{path}/countries.json")
    end

    def self.carriers
      get(url: "#{path}/carriers.json")
    end

    protected

    def self.path
      super + '/metadata'
    end

  end
end
