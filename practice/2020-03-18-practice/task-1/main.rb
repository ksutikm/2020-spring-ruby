require_relative "my_complex"

def main
  my_complex_one = MyComplex.new(2.0, -5.0)
  my_complex_two = MyComplex.new(3.0, 7.0)
  pp my_complex_one
  pp my_complex_two
  p my_complex_one
  puts my_complex_one
  puts my_complex_two
  puts "real: #{my_complex_two.real}"
  puts "add 2 complex digits = #{my_complex_one.add(my_complex_two)}"
  puts "sub 2 complex digits = #{my_complex_one.sub(my_complex_two)}"
  puts "multiply 2 complex digits = #{my_complex_one.multiply(my_complex_two)}"
  puts "divide 2 complex digits = #{my_complex_one.divide(my_complex_two)}"
end

if __FILE__ == $0
  main
end
