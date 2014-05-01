class BookInStock
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
  attr_reader :isbn
  attr_accessor :price

  def price_in_cents
    Integer(price*100+0.5)
  end

  def price_in_cents=(cents)
    @price = cents/100.0
  end
end