import UIKit

func add(_ num1: Int, _ num2: Int) -> Int { num1 + num2 }

let task1: Any = add(2, 3)

(task1 as! Int) + (task1 as! Int)

let task2: Any = add


(task2 as! ((Int, Int) -> Int))(1, 2) + (task2 as! ((Int, Int) -> Int))(1, 2)

//class Car {}

let values: [Any] = [
  0,
  0.0,
  (2.0, Double.pi),
//  Car(),
  { (str: String) -> Int in str.count }
]

for value in values {
    switch value {
    case let castedValue where castedValue as? Int != nil:
        print("\(castedValue) is Int")
    case let castedValue where castedValue as? Double != nil:
        print("\(castedValue) is Double")
    case let castedValue where castedValue as? (Double, Double) != nil:
        print("\(castedValue) is (Double, Double)")
//    case let castedValue where castedValue as? Car != nil:
//        print("\(castedValue) is Car()")
    case let castedValue where castedValue as? (String) -> Int != nil:
        print("\(castedValue) is (String) -> Int")
    default:
        print("unidentifided")
    }
}

class Vehicle {
    let name: String
    let maxSpeed: Int
    
    init() {
        self.name = "name"
        self.maxSpeed = 100
    }
    
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
}

class Car: Vehicle {
    var modelYear: Int?
    var numberOfSeats: Int?
    
    init?(modelYear: Int, numberOfSeats: Int) {
        super.init()
        
        guard modelYear < 1 || numberOfSeats < 1 else { return nil }
        
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
    }
}

class Bus: Vehicle {
    let isDoubleDecker: Bool
    
    init(isDoubleDecker: Bool, maxSpeed: Int) {
        self.isDoubleDecker = isDoubleDecker
        
        super.init()
    }
    
    convenience init(isDoubleDecker: Bool) {
        self.init(isDoubleDecker: isDoubleDecker, maxSpeed: 100)
    }
}
