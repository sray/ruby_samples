#!/usr/bin/ruby
def showRegExp(string,pattern)
  match = pattern.match(string)
  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"
  else
    "no match"
  end
end

puts showRegExp('very interesting',/t/)
puts showRegExp('Fats Waller',Regexp.new("lle"))
puts showRegExp('Fats Waller',%r{z})
puts showRegExp('yes | no',%r{\|})
puts showRegExp('yes (no)',Regexp.new(/\(no\)/))
puts showRegExp('are you sure?',/e\?/)

str = "this is\nthe time"
puts showRegExp(str,/^the/)
puts showRegExp(str,/is$/)
puts showRegExp(str,/\Athis/)
puts showRegExp(str,/\Athe/)
## nonword boundaries only
puts showRegExp(str,/\bis/)
## word boundaries only
puts showRegExp(str,/\Bis/)
puts
str = 'Price $12.'
puts showRegExp(str,/[aeiou]/)
puts showRegExp(str,/[\s]/)
puts showRegExp(str,/[\d]/)
puts showRegExp(str,/[$.]/)
puts
str = 'see [The PickAxe-page 123]'
puts showRegExp(str,/[A-F]/)
puts showRegExp(str,/[A-Fa-f]/)
puts showRegExp(str,/[0-9]/)
puts showRegExp(str,/[0-9][0-9]/)
puts showRegExp(str,/[\[0-9\]]/)
puts
str = 'Price $12.'
puts showRegExp(str,/[^A-Z]/)
puts showRegExp(str,/[^\w]/)
puts showRegExp(str,/[a-z][^a-z]/)
puts
str = 'über.'
# following 5 examples cause error: undefined group option
#puts showRegExp(str,/(?a)\w+/)
#puts showRegExp(str,/(?d)\w+/)
#puts showRegExp(str,/(?u)\w+/)
#puts showRegExp(str,/(?d)\W+/)
#puts showRegExp(str,/(?u)\W+/)

str = "quick brown fox"
puts str.sub(/[aeiou]/,'*')
puts str.gsub(/[aeiou]/,'*')
puts str.sub(/\s\S+/,'_')
puts str.gsub(/\s\S+/,'_')
puts str.sub(/^./) { |match| match.upcase }
puts str.sub(/[aeiou]/) { |vowel| vowel.upcase }

def mixedCase(name)
  name.downcase.gsub(/\b\w/) { |first| first.upcase }
end

puts mixedCase("DAVE THOMAS")
puts mixedCase("dave thomas")
puts mixedCase("dAvE tHoMas")

replacement = { "cat" => "feline", "dog" => "canine" }
replacement.default = "unknown"
repl = "cat and dog".gsub(/\w+/,replacement)
puts repl

puts "fred:smith".gsub(/(\w+):(\w+)/, '\2, \1')
puts "fred:smith".gsub(/(?<first>\w+):(?<last>\w+)/, '\k<last>, \k<first>')
str = 'a\b\c'
puts str.gsub(/\\/,'\\\\\\\\')
# \& refers to last match
puts str.gsub(/\\/,'\&\&')
puts str.gsub(/\\/) { '\\\\' }
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')
