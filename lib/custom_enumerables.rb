# frozen_string_literal: true

require_relative 'test_methods'

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
    my_each do
      yield(i, j)
      j += 1
    end
    self
  end

  # Returns an array containing all elements of enum for which the given block returns a true value.
  # Returns hash for hashes
  def my_select
    case self
    when Array
      store_return = []
      my_each { |i|store_return << i if yield i }
    when Hash
      store_return = {}
      my_each { |k| store_return[k[0]] = k[1] if yield k }
    end
    store_return
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block never returns false or nil.
  # If the block is not given, Ruby adds an implicit block of { |obj| obj }
  # which will cause all? to return true when none of the collection members
  # are false or nil.
  def my_all?
    
  end
end

TestMethods.new
