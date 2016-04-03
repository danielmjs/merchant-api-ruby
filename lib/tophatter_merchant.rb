require 'active_model'

require File.dirname(__FILE__) + '/tophatter_merchant/version'
require File.dirname(__FILE__) + '/tophatter_merchant/exceptions'

# Resources:
require File.dirname(__FILE__) + '/tophatter_merchant/resource'
require File.dirname(__FILE__) + '/tophatter_merchant/account'
require File.dirname(__FILE__) + '/tophatter_merchant/api_key'
require File.dirname(__FILE__) + '/tophatter_merchant/image'
require File.dirname(__FILE__) + '/tophatter_merchant/mailing_address'
require File.dirname(__FILE__) + '/tophatter_merchant/metadata'
require File.dirname(__FILE__) + '/tophatter_merchant/order'
require File.dirname(__FILE__) + '/tophatter_merchant/payout_option'
require File.dirname(__FILE__) + '/tophatter_merchant/product'
require File.dirname(__FILE__) + '/tophatter_merchant/product_variation'

module TophatterMerchant

  def self.access_token
    defined?(@@access_token) ? @@access_token : nil
  end

  def self.access_token=(token)
    @@access_token = token
  end

  def self.api_path
    defined?(@@api_path) ? @@api_path : 'https://tophatter.com/merchant_api/v1'
  end

  def self.api_path=(path)
    @@api_path = path
  end

end
