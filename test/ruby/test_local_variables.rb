require 'test/unit'

class MyClass
end

class TestCall < Test::Unit::TestCase
  def foo(i)
    outside_proc = 'this-var-is-not-displayed'

    proc do
      foo_var = 'foo_var'
      bar_var = [1,2,3,4,5]
      my_class = MyClass.new

      proc do
        inner_variable = 10000
        crash(foo_var, bar_var, my_class)
      end.call

    end.call
  end

  def bar(v)
    outside_bar = 'outside bar'
    proc do
      bar_var = 'bar_var'

      foo(bar_var)
    end.call
  end

  def test_exception_variables
    var1 = 'var1'

    bar(var1)
  end
end
