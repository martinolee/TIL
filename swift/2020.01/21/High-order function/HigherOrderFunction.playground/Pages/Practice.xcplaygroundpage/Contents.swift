//: [Previous](@previous)
import Foundation

// 키노트 문제 참고
/*:
 ---
 ## Practice 1
 ---
 */
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
  enum PetType {
    case dog, cat, snake, pig, bird
  }
  var type: PetType
  var age: Int
}

let myPet = [
  Pet(type: .dog, age: 13),
  Pet(type: .dog, age: 2),
  Pet(type: .dog, age: 7),
  Pet(type: .cat, age: 9),
  Pet(type: .snake, age: 4),
  Pet(type: .pig, age: 5),
]

// 1번
func sumDogAge(pets: [Pet]) -> Int {
  pets
    .filter { $0.type == .dog }
    .reduce(0) { $0 + $1.age }
}
sumDogAge(pets: myPet)

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
  pets
    .map{ Pet(type: $0.type, age: $0.age + 1) }
}
oneYearOlder(of: myPet)

/*:
 ---
 ## Practice 2
 ---
 */
print("\n---------- [ Practice 2 ] ----------\n")


let immutableArray = Array(1...40)
var result = 0

for i in 0 ..< immutableArray.count {
  let tempNum = i * immutableArray[i]
  if tempNum % 2 == 0 {
    result += tempNum
  }
}

print(result)

// 1. 배열의 각 요소 * index 값을 반환하는 함수
// 2. 짝수 여부를 판별하는 함수
// 3. 두 개의 숫자를 더하여 반환하는 함수

func mutiplyIndexValue(_ arr: [Int]) -> [Int] {
  arr
    .enumerated()
    .map { $0 * $1 }
}

func isEvenNumber(_ arr: [Int]) -> [Int] {
  arr.filter { $0.isMultiple(of: 2) }
}

func addAllNumber(_ arr: [Int]) -> Int {
  arr.reduce(0, +)
}

print(immutableArray
  .enumerated()
  .map(*)
  .filter { $0.isMultiple(of: 2) }
  .reduce(0, +))

print(addAllNumber(isEvenNumber(mutiplyIndexValue(immutableArray))))

//: [Next](@next)
