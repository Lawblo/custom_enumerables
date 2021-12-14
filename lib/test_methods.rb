# frozen_string_literal: true# create new to run tests

# Testing custom enumerable methods
class TestMethods
  include Enumerable
  attr_reader(:hash, :arr)

  def initialize
    @hash = {a: 'first', b: 'second', c: 3}
    @arr = [1, 2, 3, 'a', 'b', 'c']
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
end
