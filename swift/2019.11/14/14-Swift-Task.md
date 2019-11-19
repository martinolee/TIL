---
title: 14 Swift Task
date: 2019-11-14 20:30:47
tags: swift, optional, enum
category: swift
---

# Optional, Enum

<br>

<br>

### Combine Optional Strings and return a non Optional String

```swift
func combineStrings(str1: String?, str2: String?, str3: String?) -> String {
    (str1 ?? "") + (str2 ?? "") + (str3 ?? "")
}

combineStrings(str1: "AB", str2: "CD", str3: "EF")
// "ABCDEF"
```

<br>

### Calculate using enumeration

```swift
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
// 15

Arithmetic.subtraction.calculate(10, 5)
// 5

Arithmetic.multiplication.calculate(10, 5)
// 50

Arithmetic.division.calculate(10, 5)
// 2
```

<br>

### Convert celcius to fahrenheit and kelvin using enumertaion

```swift
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
// 100

Temperature.fahrenheit(100).toCelcius()
// 37.77777777777778

Temperature.kelvin(100).toCelcius()
// 373
```

<br>

### Calculate using enumeration and recursive call

```swift
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

evaluate(five)
// 5

evaluate(sum)
// 9

evaluate(product)
// 18
```

