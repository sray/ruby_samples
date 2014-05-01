require_relative 'cl/roman_bug'
require 'test/unit'

class TestRoman < Test::Unit::TestCase
  NUMBERS = {
      1 => "i",
      2 => "ii",
      3 => "iii",
      4 => "iv",
      5 => "v",
      9 => "ix"
    }
  
  def test_simple
    ## newbie version
    #r = RomanBug.new(1)
    #fail "'i' expected " unless r.to_s == "i"
    #r = RomanBug.new(9)
    #fail "'ix' expected " unless r.to_s == "ix"
    #r = RomanBug.new(6)
    #fail "'vi' expected " unless r.to_s == "vi"
    
    ## beginner version
    #assert_equal("i",RomanBug.new(1).to_s)
    #assert_equal("ii",RomanBug.new(2).to_s)
    #assert_equal("iii",RomanBug.new(3).to_s)
    #assert_equal("ix",RomanBug.new(9).to_s)
    #assert_equal("vi",RomanBug.new(6).to_s)
    
    ## amateur version
    NUMBERS.each do |arab, rom|  
      r = RomanBug.new(arab)
      assert_equal(rom,r.to_s)
    end
    
  end
  
  def test_range
    RomanBug.new(1)
    RomanBug.new(4999)
    assert_raises(RuntimeError) {
      RomanBug.new(0)
    }
    assert_raises(RuntimeError) {
      RomanBug.new(5000)
    }
  end
end

