module TophatterMerchant
  class Account < Resource

    attr_accessor :access_token, :first_name, :last_name, :store_name, :email, :country, :time_zone

    class << self

      # ap TophatterMerchant::Account.schema
      def schema
        get(url: "#{path}/schema.json")
      end

      # ap TophatterMerchant::Account.authenticate(email: 'megatron@autobot.com', password: 'ipipip').to_h
      def authenticate(email:, password:)
        Account.new post(url: "#{path}/authenticate.json", params: {
          email: email,
          password: password
        })
      end

      # ap TophatterMerchant::Account.create(first_name: 'Foo', last_name: 'Bar', store_name: 'Foo Bar, Inc', email: 'foo@bar.com', password: 'ipipip').to_h
      def create(first_name:, last_name:, store_name:, email:, password:)
        Account.new post(url: "#{path}.json", params: {
          first_name: first_name,
          last_name: last_name,
          store_name: store_name,
          email: email,
          password: password
        })
      end

      # Change first & last name:
      # ap TophatterMerchant::Account.update(first_name: 'Mega', last_name: 'Tron').to_h
      # Change password:
      # ap TophatterMerchant::Account.update(password: 'qwer1234').to_h
      # ap TophatterMerchant::Account.authenticate(email: 'megatron@autobot.com', password: 'qwer1234').to_h
      # ap TophatterMerchant::Account.update(password: 'ipipip').to_h
      def update(params)
        Account.new post(url: "#{path}/update.json", params: params)
      end

      protected

      def path
        super + '/account'
      end

    end
  end
end
