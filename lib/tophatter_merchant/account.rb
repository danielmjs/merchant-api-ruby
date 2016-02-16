module TophatterMerchant
  class Account < Resource

    def self.authenticate(email:, password:)
      response = post(url: "#{path}/authenticate.json", params: {
        email: email,
        password: password
      })
      Hashie::Mash.new response
    end

    def self.create(name:, email:, password:)
      response = post(url: "#{path}.json", params: {
        user: {
          name: name,
          email: email,
          password: password
        }
      })
      Hashie::Mash.new response
    end

    protected

    def self.path
      super + '/account'
    end

  end
end
