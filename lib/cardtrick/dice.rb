class Dice
  attr_reader :total, :frequency
  def initialize h={}
    @h = h
    @res, @totals, @total, @frequency = [], [], 0, Hash.new { |h,k| h[k] = 0 }
  end

  def next!
    ra, rt = [], 0 
    (@h[:num] || 1).times do
      a, x = [], rand(1..(@h[:sides] || 2));
      @frequency[x] += 1;
      @total += x
      ra << x
      rt += x
    end
    @totals << rt
    @res << ra
    return nil
  end

  def map &b
    next!
    b.call(self)
  end
  
  def length
    @res.length
  end

  def value
    @totals[-1]
  end

  def values
    @res[-1]
  end

  def sides
    @h[:sides]
  end

  def num
    @h[:num]
  end

  def key
    @h[:key] || to_dice
  end

  def to_a
    @res
  end

  def to_i
    @total
  end

  def to_s
    %[I rolled #{to_dice} and got #{@total}.]
  end

  def to_dice
    %[#{@h[:num]}d#{@h[:sides]}]
  end

end
