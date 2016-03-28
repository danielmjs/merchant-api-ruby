module TophatterMerchant
  class Image < Resource

    attr_accessor :image_id

    class << self

      def create(file)
        Hashie::Mash.new post(url: "#{path}.json", params: { data: file })
      end

      protected

      def path
        super + '/images'
      end

    end
  end
end
