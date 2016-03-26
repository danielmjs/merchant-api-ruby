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

    def self.update_seller_name(name:)
      put(url: "#{path}/update_seller_name.json", params: {
        name: name
      })
    end

    protected

    def self.path
      super + '/account'
    end

  end
end
