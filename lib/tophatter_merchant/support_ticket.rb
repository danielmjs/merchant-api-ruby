module TophatterMerchant
  class SupportTicket < Resource

    def self.all(page: 1, per_page: 50)
      get(url: "#{path}.json", params: { page: page, per_page: per_page }).map do |hash|
        Hashie::Mash.new hash
      end
    end

    def self.update(data)
      Hashie::Mash.new post(url: "#{path}/update.json", params: data)
    end

    protected

    def self.path
      super + '/support_tickets'
    end

  end
end
