import UIKit

let combineStrings: (String?, String?, String?) -> String = { ($0 ?? "") + ($1 ?? "") + ($2 ?? "") }

combineStrings("AB", "CD", "EF")

enum Arithmetic {
    case addition((Double, Double) -> Double = { $0 + $1 })
    case subtraction((Double, Double) -> Double = { $0 - $1 })
    case multiplication((Double, Double) -> Double = { $0 * $1 })
    case division((Double, Double) -> Double = { $0 / $1 })
}

let addition: ((Double, Double) -> Double) = { $0 + $1 }
let subtraction: ((Double, Double) -> Double) = { $0 - $1 }
let multiplication: ((Double, Double) -> Double) = { $0 * $1 }
let division: ((Double, Double) -> Double) = { $0 / $1 }

enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
}



let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
    let isAscending: Bool

    if s1 > s2 {
        isAscending = true
    } else {
        isAscending = false
    }

    return isAscending
}

let optimizedSomeClosure: (String, String) -> Bool = { $0 > $1 }

someClosure("a", "b")
optimizedSomeClosure("a", "b")

someClosure("b", "a")
optimizedSomeClosure("b", "a")



let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
    var count: Int = 0
    for _ in values {
        count += 1
    }
    return count
}

let optimizedOtherClosure: ([Int]) -> Int = { $0.count }

otherClosure([0, 1, 2, 3, 4])
optimizedOtherClosure([0, 1, 2, 3, 4])

otherClosure([0])
optimizedOtherClosure([0])
