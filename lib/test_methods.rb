# frozen_string_literal: true# create new to run tests

# Testing custom enumerable methods
class TestMethods
  include Enumerable
  attr_reader(:hash, :arr)

  def initialize
    @hash = {a: 'first', b: 'second', c: 3}
    @arr = [1, 2, 3]
    # @arr = [nil, nil, nil]
  end

  def test_my_select
    p(arr.select      { |i| i.is_a? String })
    p(arr.my_select   { |i| i.is_a? String })
    p(hash.select     { |k, v| v.is_a? String })
    p(hash.my_select  { |k, v| v.is_a? String })
  end

  def test_my_all
    p(arr.all?      { |i| i == String})
    p(arr.my_all?   { |i| i == String})
    p(arr.all?      { |i| i != String})
    p(arr.my_all?   { |i| i != String})
    p(hash.all?     { |k, v| k == String })
    p(hash.my_all?  { |k, v| k == String })
    p(hash.all?     { |k, v| k != String })
    p(hash.my_all?  { |k, v| k != String })
  end

  def test_my_any
    p(arr.any?      { |i| i == 1})
    p(arr.my_any?   { |i| i == 1})
    p(hash.any?     { |k, v| v == 'first'})
    p(hash.my_any?  { |k, v| v == 'second'})
  end

  def test_my_none
    # p(arr.none?     { |i| i == 4})
    # p(arr.my_none?  { |i| i == 4})
    p(hash.none?     { |k, v| v == 'first'})
    p(hash.my_none?  { |k, v| v == 'second'})
  end
end
