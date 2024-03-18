
class Coin
  def initialize h={}
    @key = h.delete(:key)
    @h = h
    @last = @h.keys.sample
  end
  def key
    @key
  end
  def map &b
    @last = @h.keys.sample
    b.call(self)
  end
  def last
    @last
  end
  def value
    @h[@last]
  end
  def to_s
    %[Flipped #{key} and got #{value}.]
  end
end

class Coins
  def initialize *a
    @coins = [a].flatten
  end
  def map &b
    h = {}
    @coins.each { |e|
      h[e] = Cardtrick[e].map { |ee| b.call(ee) }
    }
    return h
  end
end
