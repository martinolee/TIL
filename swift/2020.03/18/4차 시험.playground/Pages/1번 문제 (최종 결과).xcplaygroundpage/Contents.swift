/*:
 ---
 ## 1번 문제 (최종 결과)
 ---
 */
import Foundation

func fizzBuzz(n: Int) -> String {
  if n % 15 == 0 {
    return "FizzBuzz"
  } else if n % 3 == 0 {
    return "Fizz"
  } else if n % 5 == 0 {
    return "Buzz"
  }
  
  return "\(n)"
}

fizzBuzz(n: 15)
fizzBuzz(n: 3)
fizzBuzz(n: 5)
fizzBuzz(n: 4)

func fizzBuzz2(n: Int) -> String {
  switch n {
  case n where (n % 15 == 0):
    return "FizzBuzz"
  case n where (n % 3 == 0):
    return "Fizz"
  case n where (n % 5 == 0):
    return "Buzz"
  default:
    return "\(n)"
  }
}

fizzBuzz(n: 15)
fizzBuzz(n: 3)
fizzBuzz(n: 5)
fizzBuzz(n: 4)

let fizzBuzz3: ((Int) -> String) = {
  
  if $0 % 15 == 0 {
    return "FizzBuzz"
  } else if $0 % 3 == 0 {
    return "Fizz"
  } else if $0 % 5 == 0 {
    return "Buzz"
  }
  
  return "\($0)"
}

print((1...100).map(fizzBuzz3))
