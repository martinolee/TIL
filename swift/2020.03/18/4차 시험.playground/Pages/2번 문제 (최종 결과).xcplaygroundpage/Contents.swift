/*:
 ---
 ## 2번 문제 (최종 결과)
 ---
 */
import Foundation

func fibonacci(n: Int) -> Int {
  guard n > 0 else { return 0 }
  
  var arr = Array(0..<n)
  
  for i in 0 ..< arr.count {
    if i - 1 > 0 {
      arr[i] = arr[(i - 2)] + arr[(i - 1)]
    }
  }
  
  return arr.last!
}

for i in 1 ... 12 {
  print(fibonacci(n: i))
}
