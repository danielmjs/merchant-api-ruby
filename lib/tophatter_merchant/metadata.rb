module TophatterMerchant
  class Metadata < Resource

    def self.all
      get(url: "#{path}.json")
    end

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
    
    def self.country_codes
      get(url: "#{path}/country_codes.json")
    end

    def self.states
      get(url: "#{path}/states.json")
    end

    def self.provinces
      get(url: "#{path}/provinces.json")
    end

    def self.territories
      get(url: "#{path}/territories.json")
    end

    protected

    def self.path
      super + '/metadata'
    end

  end
end
