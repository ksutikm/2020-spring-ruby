def help
  puts "Данное приложение решает пример: max{min(a, b), min(c, d)}. Передайте 4 числа в качестве аргументов приложения.\n\n"
  puts "task_1_2_12.rb --a=NUMBER1 --b=NUMBER2 --c=NUMBER3 --d=NUMBER4\n"
end

def max(a, b)
  a > b ? a : b
end

def min(a, b)
  if a < b
    a
  else
    b
  end
end

def main
  args_in_hash = ARGV.map do |argument|
    elements = argument.split("=")
    [
      elements.first.sub(/--/, ""),
      elements.last,
    ]
  end.to_h
  res = max(min(args_in_hash["a"], args_in_hash["b"]), min(args_in_hash["c"], args_in_hash["d"]))
  puts "max{min(#{args_in_hash["a"]}, #{args_in_hash["b"]}), min(#{args_in_hash["c"]}, #{args_in_hash["d"]})} = #{res}"
end

if __FILE__ == $0
  if ARGV.length == 0
    help
  else
    main
  end
end
