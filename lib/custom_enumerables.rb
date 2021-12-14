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
    for i in self do 
      yield(i, j)
      j += 1
    end
    self
  end

  # Returns an array containing all elements of enum for which the given block returns a true value.
  def my_select
    store = {} if self.class == Hash 
    store = [] if self.class == Array
    if self.is_a? Array
      for i in self do
        store << i if yield i
      end
    elsif self.is_a? Array
      for i in self do
        store[i] = j if yield j
      end
    end 
    store
  end

end

# create new to run tests
class TestMethods
  include Enumerable
  attr_accessor(:hash, :arr)

  def initialize
    @hash = {a: 'first', b: 'second'}
    @arr = [1, 2, 3, 'a', 'b', 'c']
    test_my_select
  end

  def test_my_select
    #p select_array = arr.select { |i| i.is_a? String }
    #p my_select_array = arr.my_select { |i| i.is_a? String }
    p select_hash = hash.select { |i, j| j.is_a? String }
    p my_select_hash = hash.my_select { |i, j| j.is_a? String }
  end
end

TestMethods.new
