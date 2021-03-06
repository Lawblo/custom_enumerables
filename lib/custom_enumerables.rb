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
    return self unless block_given?

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
    self.my_each { |i| return true if i } unless block_given?
    all_true = true
    case self
    when Array
      my_each { |i| all_true = false unless yield i }
    when Hash
      my_each { |i| all_true = false unless yield i[1] }
    end
    all_true
  end

  # Passes each element of the collection to the given block.
  # The method returns true if the block ever returns a value other than false or nil.
  # If the block is not given, Ruby adds an implicit block of { |obj| obj } that will
  # cause any? to return true if at least one of the collection members is not false or nil.
  def my_any?
    my_each { |i| return true if i } unless block_given?
    my_each  {|i| return true if yield(i)}
    false
  end

  def my_none?
    no_true = true
    my_each { |i| no_true = false if i } if !block_given?
    my_each { |i| no_true = false if yield i }
    no_true
  end

  # Returns the number of items in enum through enumeration.
  # If an argument is given, the number of items in enum that are equal to item are counted.
  # If a block is given, it counts the number of elements yielding a true value.
  def my_count
    return length unless block_given?

    count = 0
    my_each { |i| count += 1 if yield i }
    count
  end

  # Returns a new array with the results of running block once for every element in enum.
  # If no block is given, an enumerator is returned instead.
  def my_map
    # not returning enumerator
    return self unless block_given?

    mapped_array = []
    my_each { |i| mapped_array << yield(i)}
    mapped_array
  end

  # Combines all elements of enum by applying a binary operation,
  # specified by a block or a symbol that names a method operator.
  # If you specify a block, then for each element in enum the block is passed
  # an accumulator value (memo) and the element.
  # If you specify a symbol instead, then each element in the collection will be passed to the named method of memo.
  # In either case, the result becomes the new value for memo. At the end of the iteration,
  # the final value of memo is the return value for the method.
  # If you do not explicitly specify an initial value for memo,
  # then the first element of collection is used as the initial value of memo.
  def my_inject(initial = nil)
    gather = initial
    my_each { |i| gather = !gather ? i : yield(gather, i) }
    gather
  end
end

TestMethods.new.multiply_els
