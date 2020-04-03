import RxSwift

let disposeBag = DisposeBag()

let source$ = Observable<Int>
  .interval(.seconds(2), scheduler: MainScheduler.instance)
  .take(2)

// 0--1--2--3--4--5--6--...

let target$ = source$.flatMap { value in
  Observable<Int>
    .interval(.seconds(1), scheduler: MainScheduler.instance)
    .take(3)
    .map { innerValue in "source: \(value), target: \(innerValue)" }
}


print("start")
target$
  .subscribe(onNext: {
    print($0)
  }, onCompleted: {
    print("completed")
  }, onDisposed: { print("disposed") })
  .disposed(by: disposeBag)
