# expressions are objects and are assignable to variables
# e.g. exp = if true then do end

require_relative('cl/score_keeper')
scores = ScoreKeeper.new
scores.<<(10).<<(20).<<(40)
## is the same as scores << 10 << 20 << 40 (enabled by return self in <<-method)
puts "Average = #{scores.average}"

require_relative('cl/my_collection')
s = MyCollection.new
s[1]= 2
s['cat','dog']= 'enemies'

# command expressions
puts `date`
puts `ls`
puts %x{echo "Hey Jo"}
puts "Exit status of last command: #{$?}"

alias old_backquote `
def `(cmd)
  result = old_backquote(cmd)
  if $? != 0
    puts "*** Command #{cmd} failed: status = #{$?.exitstatus}"
  end
end

print `ls -l /etc/passwd`
print `ls -l /etc/wibble`
  
# assignment expressions
a = b = 1 + 2 + 3
print(a, " ; ", b)
puts
a = (b = 1 + 2) + 3
print(a, " ; ", b)

## parallel assignments
a, b = 1,2
a,b = b,a
puts
print(a, " ; ", b)

## works with splats on both sides of the assignments
a,b,c,d,e = *(1..2),3,*4
puts
print(a, " ; ", b, " ; ", c , " ; ", d , " ; ", e )
a,*b=1,2,3
puts
print(a, " ; ", b)
## b becomes an empty array and e will be nil/ unassigned
a,*b,c,d,e=1,2,3
puts
print(a, " ; ", b, " ; ", c , " ; ", d , " ; ", e )
a,*,b=1,2,3,4,5,6
puts
print(a, " ; ", b)

# nested assignments
a,(b,c),d= 1,[2,3],4
puts
print(a, " ; ", b, " ; ", c , " ; ", d )
a,(b,c),d= 1,[2,3,4],5
puts
print(a, " ; ", b, " ; ", c , " ; ", d )
a,(b,*c),d= 1,[2,3,4],5
puts
print(a, " ; ", b, " ; ", c , " ; ", d )
