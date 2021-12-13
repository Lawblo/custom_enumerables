# frozen_string_literal: true

# already existing module, adding methods
module Enumerable
  def my_each
    for i in self do
      yield i
    end
  end
end

# create new to run tests
class TestMethods
  include Enumerable

  def initialize
    test_each
  end

  def test_each
    puts '##testing my_each:##'
    puts "\n##TESTING WITH HASHES##\n"
    hash = {a: 'first', b: 'second'} 
    puts "\nhash.my_each:"; hash.my_each {|i| puts i};
    puts "\nhash.each:"; hash.each {|i| puts i}
    puts "\n##TESTING WITH ARRAY##\n"
    arr = [1, 2, 3, 'a', 'b', 'c']
    puts "\narr.my_each\n";
    arr.my_each { |i| puts i }
    puts "\narr.each\n"; arr.each { |i| puts i }
  end
end

TestMethods.new
