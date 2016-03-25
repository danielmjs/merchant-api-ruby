module TophatterMerchant
  class Account < Resource

    def self.authenticate(email:, password:)
      Hashie::Mash.new post(url: "#{path}/authenticate.json", params: {
        email: email,
        password: password
      })
    end

    def self.create(name:, email:, password:)
      Hashie::Mash.new post(url: "#{path}.json", params: {
        user: {
          name: name,
          email: email,
          password: password
        }
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

    def self.api_keys
      get(url: "#{path}/api_keys.json").collect do |api_key|
        Hashie::Mash.new(api_key)
      end
    end

    def self.generate_api_key
      Hashie::Mash.new post(url: "#{path}/generate_api_key.json")
    end

    def self.revoke_api_key(api_key_id:)
      post(url: "#{path}/revoke_api_key.json", params: { api_key_id: api_key_id }).collect do |api_key|
        Hashie::Mash.new(api_key)
      end
    end

    protected

    def self.path
      super + '/account'
    end

  end
end
