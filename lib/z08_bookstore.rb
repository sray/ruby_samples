class BookInStock
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end
  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
end

booka = BookInStock.new("isbn1",3)
bookb = BookInStock.new("isbn2",3.14)
bookc = BookInStock.new("isbn3","5.67")
p booka
p bookb
p bookc

class BookInStock
  attr_reader :isbn
  attr_accessor :price
  
  def price_in_cents
    Integer(price*100+0.5)
  end
  def price_in_cents=(cents)
      @price = cents/100.0
    end
end

bookd = BookInStock.new("isbn4",12.34)
puts "ISBN = #{bookd.isbn}"
puts "price = #{bookd.price}"
puts "price in cents = #{bookd.price_in_cents}"
bookd.price = bookd.price*0.75
puts "new price = #{bookd.price}"
booke = BookInStock.new("isbn5",33.80)
puts "price = #{booke.price}"
puts "price = #{bookd.price_in_cents}"
booke.price_in_cents=5678
puts "price = #{booke.price}"
puts "price = #{booke.price_in_cents}"

require 'csv'

class CsvReader
  def initialize
    @books_in_stock=[]
  end
  
  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row|
      @books_in_stock << BookInStock.new(row["ISBN"],row[Price])
    end
  end
  def total_value_in_stock
    
  end
  def number_of_each_isbn
    
  end
end
