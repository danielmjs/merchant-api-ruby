module TophatterMerchant
  class Metadata < Resource
    class << self

      def all
        get(url: "#{path}.json")
      end

      def conditions
        get(url: "#{path}/conditions.json")
      end

      def categories
        get(url: "#{path}/categories.json")
      end

      def sizes
        get(url: "#{path}/sizes.json")
      end

      def countries
        get(url: "#{path}/countries.json")
      end

      def country_codes
        get(url: "#{path}/country_codes.json")
      end

      def states
        get(url: "#{path}/states.json")
      end

      def provinces
        get(url: "#{path}/provinces.json")
      end

      def territories
        get(url: "#{path}/territories.json")
      end

      def carriers
        get(url: "#{path}/carriers.json")
      end

      protected

      def path
        super + '/metadata'
      end

    end
  end
end
