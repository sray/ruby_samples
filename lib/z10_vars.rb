person = "Tim"
puts "the object in 'person' is a #{person.class}"
puts "the object in 'person' has an id of #{person.object_id}"
puts "the object in 'person' has the value: #{person}"

person2 = person.dup
person[0]='J'
puts "person 1 is #{person}"
puts "person 2 is #{person2}"
person2 = person
person.freeze
person2[0]='K'