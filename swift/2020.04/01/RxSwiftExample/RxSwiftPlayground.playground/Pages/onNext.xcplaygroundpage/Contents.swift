import Foundation
import RxSwift

let getGooglePage: Observable<Data> = Observable.create { observer -> Disposable in
  let url: URL = URL(string: "https://google.com")!
  
  let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    if let data = data {
      observer.onNext(data)
      observer.onCompleted()
    }
    
    if let error = error {
      observer.onError(error)
    }
  })
  dataTask.resume()
  
  return Disposables.create {
    dataTask.cancel()
  }
}

let disposable: Disposable = getGooglePage.subscribe(onNext: { (data: Data) in
  print(data)
})

class GoogleViewController: UIViewController {
  let disposeBag = DisposeBag()
  var data: Data?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getGooglePage.subscribe(onNext: { [weak self] (data: Data) in
      guard let self = self else { return }
      self.data = data
      print(data)
    })
    .disposed(by: disposeBag)
  }
}

let googleViewController = GoogleViewController()

let vc = UIViewController()
vc.present(googleViewController, animated: true, completion: nil)
vc.dismiss(animated: true, completion: nil)

let disposeBag = DisposeBag()
disposable.disposed(by: disposeBag)
// ==
disposeBag.insert(disposable)
