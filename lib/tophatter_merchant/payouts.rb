module TophatterMerchant
  class Payouts < Resource

    def self.options
      Hashie::Mash.new get(url: "#{path}/account_details.json")
    end

    def self.states
      Hashie::Mash.new get(url: "#{path}/states.json")
    end

    def self.default_country
      Hashie::Mash.new get(url: "#{path}/default_country.json")
    end

    def self.verify_paypal(email, name)
      Hashie::Mash.new post(url: "#{path}/verify_paypal", params: {
        name: name,
        email: email,
      })
    end

    def self.set_bank_account(account_name, account_type, routing_number, account_number, first_name, last_name)
        Hashie::Mash.new post(url: "#{path}/set_bank_account", params:{
          account_name: account_name,
          account_type: account_type,
          routing_number: routing_number,
          account_number: account_number,
          first_name: first_name,
          last_name: last_name
          })
    end

    def self.payoneer_signup_url(callback_url)
      Hashie::Mash.new get(url: "#{path}/payoneer_signup_url?callback_url=#{callback_url}")
    end

    def self.path
      super + '/payouts'
    end
  end
end
