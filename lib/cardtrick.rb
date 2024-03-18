# frozen_string_literal: true

require_relative "cardtrick/version"

module Cardtrick
  class Error < StandardError; end
  @@GAME = lambda() { |e| puts %[GAME: #{e}] }
end

require_relative "cardtrick/dice"

require_relative "cardtrick/roll"

require_relative "cardtrick/card"

require_relative "cardtrick/deck"

require_relative "cardtrick/coin"

module Cardtrick

  @@S = {
    standard: {
      suits: [:hearts, :diamonds, :spades, :clubs],
      faces: { jack: 11, queen: 12, king: 13, ace: 1 },
      numbers: { low: 2, high: 10 },
      hand: 1,
      shuffle: true,
      specials: [
        { suit: 'red',
          card: 'Joker',
          value: 0
        },
        { suit: 'black',
          card: 'Joker',
          value: 0
        }
      ],
      deck: 'Standard poker cards'
    },
    
    tarot: {
      suits: [:cups, :pentacles, :wands, :swords],
      faces: { page: 10, knight: 10, queen: 10, king: 10, ace: 10 },
      numbers: { low: 2, high: 10 },
      hand: 3,
      shuffle: true,
      specials: [
        { suit: 'Major Arcarna',
          card: 'The Fool',
          value: 0
        },
        { suit: 'Major Arcarna',
          card: 'The Juggler',
          value: 1
        },
        { suit: 'Major Arcarna',
          card: 'The Popess',
          value: 2
        },
        { suit: 'Major Arcarna',
          card: 'The Empress',
          value: 3
        },
        { suit: 'Major Arcarna',
          card: 'The Emperor',
          value: 4
        },
        { suit: 'Major Arcarna',
          card: 'The Pope',
          value: 5
        },
        { suit: 'Major Arcarna',
          card: 'The Lovers',
          value: 6
        },
        { suit: 'Major Arcarna',
          card: 'The Chariot',
          value: 7
        },
        { suit: 'Major Arcarna',
          card: 'Justice',
          value: 8
        },
        { suit: 'Major Arcarna',
          card: 'The Hermit',
          value: 9
        },
        { suit: 'Major Arcarna',
          card: 'The Wheel of Fortune',
          value: 10
        },
        { suit: 'Major Arcarna',
          card: 'Strength',
          value: 11
        },
        { suit: 'Major Arcarna',
          card: 'The Hanged Man',
          value: 12
        },
        { suit: 'Major Arcarna',
          card: 'Death',
          value: 13
        },
        { suit: 'Major Arcarna',
          card: 'Temperance',
          value: 14
        },
        { suit: 'Major Arcarna',
          card: 'The Devil',
          value: 15
        },
        { suit: 'Major Arcarna',
          card: 'The House of God',
          value: 16
        },
        { suit: 'Major Arcarna',
          card: 'The Star',
          value: 17
        },
        { suit: 'Major Arcarna',
          card: 'The Moon',
          value: 18
        },
        { suit: 'Major Arcarna',
          card: 'The Sun',
          value: 19
        },
        { suit: 'Major Arcarna',
          card: 'Judgement',
          value: 20
        },
        { suit: 'Major Arcarna',
          card: 'The World',
          value: 21
        },                   
      ],
      deck: 'Tarot de Marsailles'
    } 
  }
  
  @@C = {}

  def self.decks
    @@S
  end
  
  def self.coin n, h={}
    @@C[n] = Coin.new(h)
  end
  
  def self.deck n, h={}
    @@C[n] = Deck.new(h)
  end

  def self.dice n, h={}
    @@C[n] = Dice.new(h)
  end

  def self.roll n, *a
    @@C[n] = Roll.new(a)
  end

  def self.coins n, *a
    @@C[n] = Coins.new(a)
  end

  def self.[] k
    @@C[k]
  end
  
  def self.keys
    @@C.keys
  end

  def self.load f
    eval(File.read(f))
  end
end

if File.exist? 'cardtrick.rb'
  Cardtrick.load 'cardtrick.rb'
end
