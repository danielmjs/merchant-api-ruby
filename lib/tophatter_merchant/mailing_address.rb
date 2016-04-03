# module TophatterMerchant
#   class MailingAddress < Resource
#
#     attr_accessor :id, :name, :address1, :address2, :city, :state, :zip, :country, :default
#
#     class << self
#
#       def schema
#         get(url: "#{path}/schema.json")
#       end
#
#       def all
#         get(url: "#{path}.json").map do |hash|
#           MailingAddress.new(hash)
#         end
#       end
#
#       def retrieve(id)
#         MailingAddress.new get(url: "#{path}/#{id}.json")
#       end
#
#       def create(params)
#         MailingAddress.new post(url: "#{path}.json", params: params)
#       end
#
#       def update(id, params)
#         MailingAddress.new put(url: "#{path}/#{id}.json", params: params)
#       end
#
#       def destroy(id)
#         delete(url: "#{path}/#{id}.json").map do |hash|
#           MailingAddress.new(hash)
#         end
#       end
#
#       protected
#
#       def path
#         super + '/mailing_addresses'
#       end
#
#     end
#   end
# end
