require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

sympatico = Startup.new("Sympatico", "Fox", "https://www.sympatico.com")
searching = Startup.new("Searching", "Fox", "https://www.thequest.com")
shop_tyd = Startup.new("Shop Til You Drop", "Lori G.", "https://shoptyd.com")
earworm = Startup.new("EarWorm", "SB Sounds", "https://earworm.com")


mark_c = VentureCapitalist.new("Mark Cuban", 3000000000)
barbara_c = VentureCapitalist.new("Barbara Corcoran", 5000000000)
daymond_j = VentureCapitalist.new("Daymond John", 600000000)
ashton_k = VentureCapitalist.new("Ashton Kutcher", 500000000)
the_oprah = VentureCapitalist.new("Oprah Winfrey", 7000000000)


sym_investment = FundingRound.new(sympatico, mark_c, "Pre-Seed", 2000000.0)

the_oprah.offer_contract(searching, "Seed", 1000000)
ashton_k.offer_contract(earworm, "Pre-Seed", 2000000)

searching.sign_contract(barbara_c, "Angel", 200000)
shop_tyd.sign_contract(daymond_j, "Seed", 2000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line