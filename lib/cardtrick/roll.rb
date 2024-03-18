class Roll
  attr_reader :dice
  def initialize *d
    @dice = [d].flatten
  end

  def each &b
    @dice.each { |e| b.call(e) }
    return nil
  end
  
  def map &b
    h = {}
    each { |e|
      ee = Cardtrick[e];
      k = ee.key
      v = ee.map { |eee| b.call(eee) }
      h[k] = v
    }
    return h
  end
  
end
