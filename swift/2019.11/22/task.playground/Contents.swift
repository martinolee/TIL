import UIKit

func plusAllDigits(_ number: Int) -> Int {
    var sum = 0
    
    for digit in String(number) { sum += Int(String(digit))! }
    
    return sum
}

plusAllDigits(13413)
plusAllDigits(100000)

func isHarshad(_ number: Int) -> Bool {
    var sum = 0
    
    for digit in String(number) { sum += Int(String(digit))! }
    
    return number % sum == 0
}

isHarshad(9)
isHarshad(777)
