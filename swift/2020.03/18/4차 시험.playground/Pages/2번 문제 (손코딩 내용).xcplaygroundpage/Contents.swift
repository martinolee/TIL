/*:
 ---
 ## 2번 문제 (손 코딩 내용)
 ---
 */
import Foundation

func fibonacci(n: Int) -> Int {
  guard n > 0 else { return 0 }
  
  var arr = Array(0..<n)
  print(arr)
  for i in 0 ..< arr.count {
    if i - 2 > 0 {
      arr[i] = arr[(i - 2)] + arr[(i - 1)]
    }
  }
  print(arr)
  return arr.last!
}
