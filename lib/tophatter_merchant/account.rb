module TophatterMerchant
  class Account < Resource

    attr_accessor :email, :name, :access_token

    class << self
      def authenticate(email:, password:)
        post(url: "#{path}/authenticate.json", params: {
          email: email,
          password: password
        })
      end

      def create(name:, email:, password:, first_name:, last_name:, country:)
        post(url: "#{path}.json", params: {
          user: {
            name: name,
            email: email,
            password: password,
            first_name: first_name,
            last_name: last_name,
            country: country
          }
        })
      end

      # @TODO: We can just use .update for this.
      def update_seller_name(name:, first_name:, last_name:, country:)
        put(url: "#{path}/update_seller_name.json", params: {
          name: name,
          first_name: first_name,
          last_name: last_name,
          country: country
        })
      end

      def update(account:, name:, email:, phone_number:, country:, time_zone:)
        Hashie::Mash.new put(url: "#{path}/#{account.access_token}.json", params: {
          user: {
            name: name,
            email: email,
            phone_number: phone_number,
            country: country,
            time_zone: time_zone
          }
        })
      end

      def change_password(account:, password:, password_confirmation:, reset_secret_token:)
        Hashie::Mash.new put(url: "#{path}/change_password.json", params: {
          account: account,
          password: password,
          password_confirmation: password_confirmation,
          reset_secret_token: reset_secret_token
        })
      end

      def unsubscribe(account:, digest_frequency:)
        Hashie::Mash.new put(url: "#{path}/unsubscribe.json", params: {
          account: account,
          digest_frequency: digest_frequency
        })
      end

      def cancel(account:)
        Hashie::Mash.new post(url: "#{path}/cancel.json", params: { account: account })
      end

      protected

      def path
        super + '/account'
      end
    end
  end
end
