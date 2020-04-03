import RxSwift

let disposeBag = DisposeBag()

let number$ = Observable<Int>
  .interval(.milliseconds(300), scheduler: MainScheduler.instance)
  .take(5)

let number2$ = Observable<Int>
  .interval(.milliseconds(500), scheduler: MainScheduler.instance)
  .take(3)

let combined$ = Observable.merge(number$, number2$)

combined$
  .subscribe(onNext: { print($0) })
  .disposed(by: disposeBag)

