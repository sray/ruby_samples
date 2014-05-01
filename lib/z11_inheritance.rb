class Parent
  def sayHello
    puts "Hello from #{self}"
  end
end

class Child < Parent
end

p = Parent.new
c = Child.new
p.sayHello()
c.sayHello()