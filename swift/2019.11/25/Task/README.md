---
title: 25 Swift Task
date: 2019-11-27 10:17:27
tags: swift, present, dismiss
category: swift

---

# Present View Example

<br>

### ViewController

```swift
import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton()
    
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .random()
        
        setupLabel()
        setupButton()
    }
    
    func setupLabel() {
        label.frame.size = CGSize(width: view.frame.width, height: 100)
        label.center = view.center
        label.text = "\(number)"
        label.textColor = .random()
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 90)
      
        view.addSubview(label)
    }
    
    func setupButton() {
        button.frame = CGRect(x: 0, y: view.bounds.height - 200,
                              width: view.bounds.width, height: 100)
        button.setTitle("Go to Next View", for: .normal)
        button.setTitleColor(.random(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      
        view.addSubview(button)
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        let nextVC = NextViewController()
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .flipHorizontal
        
        number += 1
        present(nextVC, animated: true, completion: nil)
    }
    
}
```

<br>

### NextViewController

```swift
import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = .random()
        
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLabel()
    }
    
    func setupLabel() {
        let label = UILabel()
      
        guard let vc = presentingViewController as? ViewController else { return }
        
        label.frame.size = CGSize(width: view.frame.width, height: 100)
        label.center = view.center
        label.text = "\(vc.number)"
        label.textColor = .random()
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 90)
        
        view.addSubview(label)
    }
    
    func setupButton() {
        let button = UIButton()
      
        button.frame = CGRect(x: 0, y: view.bounds.height - 200, width: view.bounds.width, height: 100)
        button.setTitle("Back to Pervious View", for: .normal)
        button.setTitleColor(.random(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
      
        view.addSubview(button)
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else { return }
      
        vc.number += 1
        vc.label.text = "\(vc.number)"
        vc.label.textColor = .random()
        vc.button.setTitleColor(.random(), for: .normal)
        vc.view.backgroundColor = .random()
      
        dismiss(animated: true, completion: nil)
    }

}
```

<br>

After read these codes you might have a question about .random(), because UIColor has no random method. I'll let you know how to bring random method in your project. It'll make your app more colorful.

```swift
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
```

<br>

here is the result of these codes

<img src="/Users/soohanlee/Documents/dev/ghblog/source/_posts/25-Swift-Task/Task.mp4" alt="Example Video" style="zoom:33%;" />