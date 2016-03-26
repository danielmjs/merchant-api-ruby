module TophatterMerchant
  class MailingAddress < Resource

    attr_accessor :id, :name, :address1, :address2, :city, :state, :zip, :country, :return_mailing_address

    class << self

      def schema
        get(url: "#{path}/schema.json")
      end

      def all
        response = get(url: "#{path}.json")
        response.map { |hash| MailingAddress.new(hash) }
      end

      def retrieve(id)
        MailingAddress.new get(url: "#{path}/#{id}.json")
      end

      # TophatterMerchant::MailingAddress.create(name: 'Chris Estreich', address1: '201 Valley Street', city: 'Los Altos', state: 'CA', zip: 94022, country: 'USA')
      def create(params)
        MailingAddress.new post(url: "#{path}.json", params: params)
      end

      def update(id, params)
        MailingAddress.new put(url: "#{path}/#{id}.json", params: params)
      end

      def destroy(id)
        response = delete(url: "#{path}/#{id}.json")
        response.map { |hash| MailingAddress.new(hash) }
      end

      protected

      def path
        super + '/mailing_addresses'
      end

    end
  end
end
