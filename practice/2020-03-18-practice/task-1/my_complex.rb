class MyComplex
  attr_reader :real, :imaginary

  def initialize(real, imaginary)
    @real = real
    @imaginary = imaginary
  end

  def to_s
    s = "#{@real} "
    s.concat(@imaginary > 0 ? "+ i * #{imaginary}" : "- i * #{(-1) * imaginary}")
  end

  def add(other)
    MyComplex.new(@real + other.real, @imaginary + other.imaginary)
  end

  def sub(other)
    MyComplex.new(@real - other.real, @imaginary - other.imaginary)
  end

  def multiply(other)
    r = @real * other.real - @imaginary * other.imaginary
    i = @real * other.imaginary + @imaginary * other.real
    MyComplex.new(r, i)
  end

  def divide(other)
    square = other.real ** 2 + other.imaginary ** 2
    r = @real * other.real + @imaginary * other.imaginary
    i = -@real * other.imaginary + @imaginary * other.real
    MyComplex.new(r / square, i / square)
  end
end
