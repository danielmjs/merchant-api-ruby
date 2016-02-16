module TophatterMerchant
  class Account < Resource

    def self.authenticate(email:, password:)
      response = execute request(method: :post, url: "#{path}/authenticate.json", params: {
        email: email,
        password: password
      })
      Hashie::Mash.new response
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

    protected

    def self.path
      super + '/account'
    end

  end
end
