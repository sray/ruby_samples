#references the file debug.rb
require_relative 'mixins/debug'

class Phonograph
  #references the module in the file debug.rb
  include Debug
  attr_reader :name
  def initialize(name)
    @name= name
  end
end

class EightTrack
  # references the module in the file debug.rb
  include Debug
  attr_reader :name
  def initialize(name)
    @name= name
  end
end

ph = Phonograph.new("West End")
et = EightTrack.new("Surrealistic Pillow")
puts ph.whoAmI?
puts et.whoAmI?