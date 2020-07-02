class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

# VentureCapitalist#name
    # returns a string that is the venture capitalist's name
# VentureCapitalist#total_worth
    # returns a number that is the total worth of this investor (e.g., think of it as how much money they have)
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end
# VentureCapitalist.all
    # returns an array of all venture capitalists
    def self.all
        @@all
    end
# VentureCapitalist.tres_commas_club
    # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
    def self.tres_commas_club
        vc_instances = self.all.select{|instances| instances.total_worth > 1000000000}
        vc_names = vc_instances.map{|info| info.name}
    end
# VentureCapitalist#offer_contract
    # given a startup object, type of investment (as a string), and the amount invested (as a float), 
    # creates a new funding round and associates it with that startup and venture capitalist.
    def offer_contract(startup, investment_type, amount)
        FundingRound.new(startup, self, investment_type, amount)
    end
# VentureCapitalist#funding_rounds
    # returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        my_rounds = FundingRound.all.select{|instances| instances.venture_capitalist == self}
    end
# VentureCapitalist#portfolio
    # Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        self.funding_rounds.map{|instances| instances.startup.name}.uniq
    end
# VentureCapitalist#biggest_investment
    # returns the largest funding round given by this venture capitalist
    def biggest_investment
        amounts = self.funding_rounds.map{|instances| instances.investment}
        self.funding_rounds.sort_by {|amounts|}.last
    end
# VentureCapitalist#invested
    # given a domain string, returns the total amount invested in that domain
    def invested(domain_name)
        domain_search = FundingRound.all.select{|instances| instances.startup.domain == domain_name}
        domain_search.map{|instances| instances.investment}.sum
    end
end
