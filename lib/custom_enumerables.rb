# frozen_string_literal: true

# already existing module, adding methods
module Enumerable
  def my_each
    return self unless block_given?

    for i in self do
      yield i
    end
    self
  end

  def my_each_with_index
    return self unless block_given?

    j = 0
    self.my_each do 
      yield(i, j)
      j += 1
    end
    self
  end

  # Returns an array containing all elements of enum for which the given block returns a true value.
  def my_select
    case self
    when Array
      store_return = []
      my_each do |i|
        store_return << i if yield i
      end
    when Hash
      store_return = {}
      my_each do |k|
        store_return[k[0]] = k[1]  if yield k
      end
    end
    store_return
  end
end

# create new to run tests
class TestMethods
  include Enumerable
  attr_accessor(:hash, :arr)

  def initialize
    @hash = {a: 'first', b: 'second', c: 3}
    @arr = [1, 2, 3, 'a', 'b', 'c']
    test_my_select
  end

  def test_my_select
    p arr.select      { |i| i.is_a? String }
    p arr.my_select   { |i| i.is_a? String }
    p hash.select     { |k, v| v.is_a? String }
    p hash.my_select  { |k, v| v.is_a? String }
  end
end



# hash = {a: 'first', b: 'second', c: 3}
# hash.each {|i, j| p "#{i} #{j}"}


TestMethods.new
