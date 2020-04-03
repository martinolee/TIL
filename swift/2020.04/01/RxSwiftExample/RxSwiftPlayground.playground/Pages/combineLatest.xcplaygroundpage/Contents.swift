import RxSwift

let disposeBag = DisposeBag()

let number$ = Observable<Int>
  .interval(.milliseconds(300), scheduler: MainScheduler.instance)
  .take(5)

let letter$ = Observable<Int>
  .interval(.milliseconds(500), scheduler: MainScheduler.instance)
  .take(3)
  .map { ["A", "B", "C"][$0] }

let combined$ = Observable.combineLatest(number$, letter$)

combined$
  .subscribe(onNext: { print($0) })
  .disposed(by: disposeBag)
