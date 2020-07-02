class Startup
    attr_accessor :name
    attr_reader :founder,:domain
    @@all = []
# Startup#name
    # returns a string that is the startup's name
# Startup#founder
    # returns a string that is the founder's name
    # Once a startup is created, the founder cannot be changed.
# Startup#domain
    # returns a string that is the startup's domain
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
# Startup#pivot
    # given a string of a domain and a string of a name, change the domain and name of the startup. 
    # This is the only public method through which the domain should be changed.
    def pivot(domain_update, new_name)
        @domain = domain_update
        @name = new_name
    end
# Startup.all
    # should return all of the startup instances
    def self.all
        @@all
    end
# Startup.find_by_founder
    # given a string of a founder's name, returns the first startup whose founder's name matches
    def self.find_by_founder(founders_name)
        self.all.find{|companies| companies.founder == founders_name}
    end
# Startup.domains
    # should return an array of all of the different startup domains
    def self.domains
        self.all.map{|info| info.domain}
    end
# Startup#sign_contract
    # given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), 
    # creates a new funding round and associates it with that startup and venture capitalist.
    def sign_contract(venture_capitalist, investment_type, amount_invested)
        FundingRound.new(self, venture_capitalist, investment_type, amount_invested)
    end
# Startup#num_funding_rounds
    # Returns the total number of funding rounds that the startup has gotten
    def my_rounds
        my_rounds = FundingRound.all.select{|rounds| rounds.startup == self}
    end
    def num_funding_rounds
        my_rounds.count
    end
# Startup#total_funds
    # Returns the total sum of investments that the startup has gotten
    def total_funds
        my_rounds.map{|rounds| rounds.investment}.sum
    end
# Startup#investors
    # Returns a unique array of all the venture capitalists that have invested in this company
    def investors
        my_rounds.map{|rounds| rounds.venture_capitalist.name}.uniq
    end
# Startup#big_investors
    # Returns a unique array of all the venture capitalists that have invested in this company and 
    # are in the Trés Commas club
    def big_investors
        my_rounds.map do |info|
            if info.venture_capitalist.total_worth > 1000000000
                info.venture_capitalist.name
            end
        end
    end
end
