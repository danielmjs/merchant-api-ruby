module TophatterMerchant
  class Account < Resource

    def self.authenticate(email:, password:)
      post(url: "#{path}/authenticate.json", params: {
        email: email,
        password: password
      })
    end

    def self.create(name:, email:, password:)
      post(url: "#{path}.json", params: {
        user: {
          name: name,
          email: email,
          password: password
        }
      })
    end

    # @TODO: We can just use .update for this.
    def self.update_seller_name(name:)
      put(url: "#{path}/update_seller_name.json", params: {
        name: name
      })
    end

    def self.update(account:, name:, email:, phone_number:, country:, time_zone:)
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

    def self.change_password(account:, password:, password_confirmation:, reset_secret_token:)
      Hashie::Mash.new put(url: "#{path}/change_password.json", params: {
        account: account,
        password: password,
        password_confirmation: password_confirmation,
        reset_secret_token: reset_secret_token
      })
    end

    def self.unsubscribe(account:, digest_frequency:)
      Hashie::Mash.new put(url: "#{path}/unsubscribe.json", params: {
        account: account,
        digest_frequency: digest_frequency
      })
    end

    def self.cancel(account:)
      Hashie::Mash.new post(url: "#{path}/cancel.json", params: { account: account })
    end

    protected

    def self.path
      super + '/account'
    end

  end
end
