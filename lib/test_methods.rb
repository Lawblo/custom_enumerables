# frozen_string_literal: true# create new to run tests

class TestMethods
  include Enumerable
  attr_accessor(:hash, :arr)

  def initialize
    @hash = {a: 'first', b: 'second', c: 3}
    @arr = [1, 2, 3, 'a', 'b', 'c']
    test_my_select
  end

  def test_my_select
    p (arr.select      { |i| i.is_a? String })
    p (arr.my_select   { |i| i.is_a? String })
    p (hash.select     { |k, v| v.is_a? String })
    p (hash.my_select  { |k, v| v.is_a? String })
  end
end