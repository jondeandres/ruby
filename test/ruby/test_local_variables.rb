require 'test/unit'

class TestCall < Test::Unit::TestCase
  def foo(i)
    foo_var = 'foo_var'

    this = will_crash!
  end

  def bar
    outside_var = 'outside_var'

    [1,2,3,4].map do |i|
      # THIS VAR VALUE CAN BE GET
      inside_var = i * 2

      foo(inside_var)
    end
  end

  def test_exception_variables
    var1 = 'var1'

    bar
  end
end
