/*:
 ---
 ## 3번 문제 (최종 결과)
 ---
 */
import Foundation

var inputCases = [
  [],
  [1],
  [1, 2, 3, 5, 6, 7, 9, 10, 14],
  [1, 1, 2, 2, 3, 3, 1, 2, 3],
  [14, 10, 9, 7, 6, 5, 3, 2, 1],
  [5, 6, 1, 3, 10, 2, 7, 14, 9],
  Array(1...10).map { _ in Int.random(in: 1...999) },
]

func insertionSort(arr: inout [Int]) {
  guard arr.count > 1 else { return }
  print(arr)
  for i in 0 ..< arr.count {
    for j in 0 ..< i {
      if arr[i] < arr[j] {
        arr.swapAt(i, j)
        print(arr)
      }
    }
  }
}

for i in 0 ..< inputCases.count {
  insertionSort(arr: &inputCases[i])
//  print(inputCases[i])
}
