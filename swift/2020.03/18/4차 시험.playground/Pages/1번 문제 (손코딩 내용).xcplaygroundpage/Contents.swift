/*:
 ---
 ## 1번 문제 (손 코딩 내용)
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

let fizzBuzz3: ((n: Int) -> String) = {
  
  if n % 15 == 0 {
    return "FizzBuzz"
  } else if n % 3 == 0 {
    return "Fizz"
  } else if n % 5 == 0 {
    return "Buzz"
  }
  
  return "\(n)"
}
