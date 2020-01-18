def main()
  for i in (1..100)
    if divisible(i, 3)
      if divisible(i, 5)
        puts "FizzBuzz"
      else
        puts "Fizz"
      end
    elsif divisible(i, 5)
      puts "Buzz"
    else
      puts i
    end
  end
end

def divisible(num, by)
  return num % by == 0
end

main
