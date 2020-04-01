import Foundation
import RxSwift

let numbers$: Observable<Int> = Observable.from([1, 2, 3])
let disposeBag = DisposeBag()

numbers$.subscribe { event in
  switch event {
  case let .next(value):
    print("value:", value)
  case let .error(error):
    print("error:", error)
  case .completed:
    print("completed")
  }
}
.disposed(by: disposeBag)

let numbers: Array<RxSwift.Event<Int>> = [.next(1), .next(2), .next(3), .completed, .next(0)]

numbers.forEach { event in
  switch event {
  case let .next(value):
    print("value:", value)
  case let .error(error):
    print("error:", error)
  case .completed:
    print("completed")
  }
}

class IntegerPrinter: ObserverType {
  func on(_ event: Event<Int>) {
    switch event {
    case let .next(value):
      print("value:", value)
    case let .error(error):
      print("error:", error.localizedDescription)
    case .completed:
      print("completed") }
  }
}

let x: Observable<Int> = Observable.just(1)
let integerPrinter = IntegerPrinter()
x.subscribe(integerPrinter)
  .disposed(by: disposeBag)
