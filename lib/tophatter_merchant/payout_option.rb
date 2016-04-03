module TophatterMerchant
  class PayoutOption < Resource

    attr_accessor :id, :account_type, :account_identifier

    # ap TophatterMerchant::PayoutOption.all.map(&:to_h)
    def self.all
      get(url: "#{path}.json").map do |hash|
        PayoutOption.new(hash)
      end
    end

    # def self.add_paypal(paypal_name:, paypal_email:)
    #   post(url: "#{path}/add_paypal.json", params: {
    #     paypal_name: paypal_name,
    #     paypal_email: paypal_email
    #   })
    # end
    #
    # def self.add_bank(first_name:, last_name:, account_name:, account_type:, routing_number:, account_number:)
    #   post(url: "#{path}/add_bank.json", params: {
    #     first_name: first_name,
    #     last_name: last_name,
    #     account_name: account_name,
    #     account_type: account_type,
    #     routing_number: routing_number,
    #     account_number: account_number
    #   })
    # end
    #
    # def self.add_payoneer(callback_url:)
    #   post(url: "#{path}/add_payoneer.json", params: {
    #     callback_url: callback_url
    #   })
    # end

    def self.path
      super + '/payout_options'
    end

  end
end
