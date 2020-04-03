import Foundation
import RxSwift

let one$: Observable<Int> = Observable.just(1)

//let error$: Observable<Int> = Observable.error("error!")

let empty$: Observable<Int> = Observable.empty()

let flag$: Observable<Bool> = Observable.of(true, false)

//let number$: Observable<Int> = Observable.from([1, 2, 3])

let interval$: Observable<Int> = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)

let oddNumber$: Observable<Int> = interval$.filter { $0 % 2 == 1 }

let lessThan4$: Observable<Int> = interval$.filter { $0 < 4 }

let firstThree$: Observable<Int> = interval$.take(3)

let skipThree$: Observable<Int> = interval$.skip(3)

//firstThree$.subscribe(onNext: { observer in
//  print(observer)
//}, onCompleted: {
//  print("completed")
//})

//oddNumber$.subscribe(onNext: { observer in
//  print(observer)
//})

//let numbers = [1, 2, 3, 4, 4, 5, 5, 3]
//let number$ = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//  .map{ i in numbers[i%numbers.count] }
//
//number$
//  .distinctUntilChanged()
//  .subscribe(onNext: {
//    print($0)
//  })

struct MyType {
  let x: Int
}

let myType = MyType(x: 0)
//let myType$: Observable<MyType> = Observable.just(MyType)
//  .distinctUntilChanged { lhs, rhs in lhs == rhs }

let number$: Observable<Int> = Observable.from([1, 2, 3])

number$
  .toArray()
  .asObservable()
  .subscribe(onNext: {
    print($0)
  }, onCompleted: { print("completed") })

print("start")
let array = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance).take(10).toArray()
array.subscribe {
  print($0)
}
print("end")

struct User {
  let age: Int = 10
  
  var isButtonEnabled: Bool { age > 10 }
}

let button: UIButton = UIButton()

let user$ = Observable.just(User())

user$
  .map { $0.isButtonEnabled }
  .subscribe(onNext: { isButtonEnabled in
    button.isEnabled = isButtonEnabled
  })
