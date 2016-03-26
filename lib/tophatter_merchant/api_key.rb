module TophatterMerchant
  class ApiKey < Resource

    def self.all
      get(url: "#{path}.json")
    end

    def self.create
      post(url: "#{path}.json")
    end

    def self.destroy(api_key_id:)
      delete(url: "#{path}/revoke_api_key.json", params: {
        api_key_id: api_key_id
      })
    end

    protected

    def self.path
      super + '/api_keys'
    end

  end
end
