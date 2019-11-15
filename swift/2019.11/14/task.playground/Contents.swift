import Foundation

func combineStrings(str1: String?, str2: String?, str3: String?) -> String {
    (str1 ?? "") + (str2 ?? "") + (str3 ?? "")
}

combineStrings(str1: "AB", str2: "CD", str3: "EF")



enum Arithmetic {
    case addition, subtraction, multiplication, division
    
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        switch self {
        case .addition:
            return firstNumber + secondNumber
        case .subtraction:
            return firstNumber - secondNumber
        case .multiplication:
            return firstNumber * secondNumber
        case .division:
            return firstNumber / secondNumber
        }
    }
}

Arithmetic.addition.calculate(10, 5)
Arithmetic.subtraction.calculate(10, 5)
Arithmetic.multiplication.calculate(10, 5)
Arithmetic.division.calculate(10, 5)



enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double {
        switch self {
        case .celcius(let celcius):
            return celcius
        case .fahrenheit(let fahrenheit):
            return (fahrenheit - 32) * 5 / 9
        case .kelvin(let kelvin):
            return kelvin + 273
        }
    }
}

Temperature.celcius(100).toCelcius()
Temperature.fahrenheit(100).toCelcius()
Temperature.kelvin(100).toCelcius()



indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let number):
        return number
    case .addition(let firstNumber, let secondNumber):
        return evaluate(firstNumber) + evaluate(secondNumber)
    case .multiplication(let firstNumber, let secondNumber):
        return evaluate(firstNumber) * evaluate(secondNumber)
    }
}

evaluate(five)    // result : 5
evaluate(sum)     // result : 9
evaluate(product) // result : 18
