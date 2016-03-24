module TophatterMerchant
  require 'active_model'
  class MailingAddress < Resource
    include ActiveModel::Model
    extend ActiveModel::Naming

    KEYS = [:id, :user_id, :braintree_address_id, :easypost_id, :name, :company, :address1, :address2, :city, :state, :zip, :country, :phone, :latitude, :longitude, :fingerprint, :return_mailing_address, :data, :valid_address_at, :deleted_at]

    attr_accessor :id, :user_id, :braintree_address_id, :easypost_id, :name, :company, :address1, :address2, :city, :state, :zip, :country, :phone, :latitude, :longitude, :fingerprint, :return_mailing_address, :data, :valid_address_at, :deleted_at

    def initialize(attributes)
      attributes.each { |k, v| send("#{k}=", v) }
    end

    def self.index(account:)
      get(url: "#{path}.json", params: { access_token: account.access_token }).collect do |mailing_address|
        # Hashie::Mash.new(mailing_address)
        MailingAddress.new mailing_address.slice(*KEYS.map(&:to_s))
      end
    end

    def self.create(account:, address_params:)
      MailingAddress.new post(url: "#{path}.json", params: address_params.merge({ access_token: account.access_token })).slice(*KEYS.map(&:to_s))
    end

    def self.update(account:, address_params:)
      id = address_params.delete(:id)
      MailingAddress.new put(url: "#{path}/#{id}.json", params: address_params.merge({ access_token: account.access_token })).slice(*KEYS.map(&:to_s))
    end

    def self.destroy(account:, id:)
      delete(url: "#{path}/#{id}.json", params: { access_token: account.access_token }).collect do |mailing_address|
        MailingAddress.new mailing_address.slice(*KEYS.map(&:to_s))
      end
    end

    protected

    def self.path
      super + '/mailing_addresses'
    end

  end
end
