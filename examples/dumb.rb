class Dummy

  attr_reader :dummy_variable

  def initialize
    dumb_limit = 10

    dumb_limit.times do |idx|
      p idx
    end

    my_raise unless dumb_limit % 2 != 0
  end

  def my_raise

    raise "Dumb raise!"
  end
end
