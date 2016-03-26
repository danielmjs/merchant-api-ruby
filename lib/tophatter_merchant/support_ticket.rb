module TophatterMerchant
  class SupportTicket < Resource

    def self.all(page: 1, per_page: 50)
      get(url: "#{path}.json", params: { page: page, per_page: per_page }).map
    end

    def self.update(data)
      post(url: "#{path}/update.json", params: data)
    end

    protected

    def self.path
      super + '/support_tickets'
    end

  end
end
