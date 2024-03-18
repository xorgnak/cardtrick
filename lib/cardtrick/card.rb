class Card
  def initialize h={}
    @card = h
  end
  def value
    @card[:value]
  end
  def card
    @card[:card]
  end
  def suit
    @card[:suit]
  end
  def to_i
    @card[:value].to_i
  end
  def to_s
    %[#{@card[:card]} of #{@card[:suit]}]
  end
end
