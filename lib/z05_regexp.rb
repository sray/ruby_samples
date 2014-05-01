#!/usr/bin/ruby
example = "Perl Python"

if example =~ /Perl.*Python/ 
  puts "astericks + dot"
end

if example =~ /Perl Python/ 
  puts "exact match"
end

if example =~ /Perl *Python/ 
  puts "space + astericks"
end

if example =~ /Perl +Python/ 
  puts "space + plus"
end

if example =~ /Perl\s+Python/ 
  puts "any whitespace char 1..n(plus)"
end

if "Ruby Python" =~ /Ruby (Perl|Python)/ 
  puts "Ruby Python"
end

#line = gets
#if line =~ /Perl|Python/
#  puts "scripting language mentioned: #{line}"
#end

