module TophatterMerchant
  class Account < Resource

    def self.authenticate(email:, password:)
      response = execute request(method: :post, url: "#{path}/authenticate.json", params: {
        email: email,
        password: password
      })
      Hashie::Mash.new response
    end

    protected

    def self.path
      super + '/account'
    end

  end
end
