require 'builder'

xml = Builder::XmlMarkup.new(target: STDOUT, indent: 2)
xml.person(type: "programmer") do
  xml.name do
    xml.first("Dave")
  end
  xml.location("Texas")
  xml.preference("ruby")
end

## builder <1.0 not available anymore
#gem 'builder','<1.0'
#require 'builder'
#xml = Builder::XmlMarkup.new(STDOUT,2)
#xml.person do
#  name("Dave T")
#  location("Texas")
#end