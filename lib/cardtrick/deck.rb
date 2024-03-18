class Deck
  def initialize h={}
    @deck = h
    @d = []
    @b = []
    create!
  end

  def create!
    (@deck[:decks] || 1).times { build! }
    if @deck[:shuffle] == true
      shuffle!
    end
  end
  
  def build!
    @deck[:suits].each do |suit|
#      puts %[build: #{suit}]
      @deck[:faces].each_pair { |face, value|
#        puts %[build: #{suit} #{face} #{value}]
        @d << Card.new( { suit: suit, card: face, value: value } )
      }
      ((@deck[:numbers][:low] || 1)..(@deck[:numbers][:high] || 10)).each { |number|
#        puts %[build: #{suit} #{number}]
        @d << Card.new( { suit: suit, card: number, value: number } )
      }
    end
    if @deck.has_key? :specials
      [@deck[:specials]].flatten.each { |e|
#        puts %[build: #{e[:suit]} #{e[:face]} #{e[:value]}]
        @d << Card.new( { suit: e[:suit], card: e[:card], value: e[:value] } )
      }
    end
    return nil
  end

  def shuffle!
    @d.shuffle!
  end
  
  def map &b
    if @d.length < (@deck[:hand] || 1)
      puts %[Only #{@d.length} cards left...]
      create!
      puts %[Now we have #{@d.length}.]
    end
    a = []
    (@deck[:hand] || 1).times { |t| x = @d.shift; @b << x; a << b.call(x) }
    return a
  end

  def left
    @d
  end

  def burn
    @b
  end
  
  def deck
    @deck[:deck]
  end
end


