import UIKit

func plusOne(to number: Int) -> Int { number * (number + 1) / 2 }

plusOne(to: 10)
plusOne(to: 100)

func ifNumberHasThreeSixNinePrintAsteriskFromOne(to here: UInt) {
    
    for number in 1 ... here {
        let hasThreeSixNine = String(number).contains("3") || String(number).contains("6") || String(number).contains("9")
        
        if hasThreeSixNine { print("*") } else { print(number) }
    }
    
}

ifNumberHasThreeSixNinePrintAsteriskFromOne(to: 10)
ifNumberHasThreeSixNinePrintAsteriskFromOne(to: 23)

func getGreastCommonDivisorAndLeastCommonMultiple(firstNumber: Int, secondNumber: Int) -> Dictionary<String, Int> {
    
    var greastCommonDivisorAndLeastCommonMultiple = Dictionary<String, Int>()
    
    func getGreastCommonDivisor(_ m: Int, _ n: Int) -> Int {
        var a: Int = 0
        var b: Int = max(m, n)
        var r: Int = min(m, n)

        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        
        return b
    }
    
    func getLeastCommonMultiple(_ m: Int, _ n: Int) -> Int {
        m * n / getGreastCommonDivisor(m, n)
    }
    
    greastCommonDivisorAndLeastCommonMultiple.updateValue(getGreastCommonDivisor(firstNumber, secondNumber), forKey: "Greatest Common Divisor")
    greastCommonDivisorAndLeastCommonMultiple.updateValue(getLeastCommonMultiple(firstNumber, secondNumber), forKey: "Least Common Multiple")
    
    return greastCommonDivisorAndLeastCommonMultiple
}

getGreastCommonDivisorAndLeastCommonMultiple(firstNumber: 140, secondNumber: 72)
