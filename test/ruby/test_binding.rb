require 'test/unit'
require 'pp'

class A
end

class B
end

class C
end

class TestBinding < Test::Unit::TestCase
  def func1
    a = A.new
    func2
  end

  def func2
    b = B.new
    func3
  end

  def func3
    c = C.new

    crashing_function(1, 2)
  end

  def crashing_function(a, b)
    d = a + b

    will_crash!(d)
  end

  def test_frames_variables
    begin
      func1
    rescue => e
      $stdout.write "\n"
      contexts = e.backtrace_context

      p contexts.size
      contexts.compact.each_with_index do |context, index|
        p "#{index} #{context.length} #{context}"
      end
    end
  end
end
