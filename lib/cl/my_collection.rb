# To change this template, choose Tools | Templates
# and open the template in the editor.

class MyCollection
  def initialize
    
  end
  
  def []=(*params)
    value = params.pop
    puts "Indexed with #{params.join(', ')}"
    puts "value = #{value.inspect}"
  end
end