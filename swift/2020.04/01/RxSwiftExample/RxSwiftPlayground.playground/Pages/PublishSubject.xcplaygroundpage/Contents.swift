import Foundation
import RxSwift

let disposeBag = DisposeBag()
let numbers$ = PublishSubject<Int>()

numbers$
  .subscribe(onNext: { print("Observer 1: \($0)") })
  .disposed(by: disposeBag)

numbers$.onNext(0)
numbers$.onNext(1)

numbers$
  .subscribe(onNext: { print("Observer 2: \($0)") })
  .disposed(by: disposeBag)

numbers$.onNext(2)
numbers$.onNext(3)
numbers$.onCompleted()
