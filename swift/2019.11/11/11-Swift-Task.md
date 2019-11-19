---
title: 11 Swift Task
date: 2019-11-12 18:33:43
category: swift
tags: swift
---

### Get two natural number and combine them into one number

```swift
func stickTwoNaturalNumbers(firstNumber: Int, secondNumber: Int) -> Int {
    Int(String(firstNumber) + String(secondNumber))!
}

stickTwoNaturalNumbers(firstNumber: 12, secondNumber: 34)
// 1234
```

<br>

### Compare two strings are the same or not

```swift
func isSameLetter(firstLetter: String, secondLetter: String) -> Bool {
    firstLetter == secondLetter
}

isSameLetter(firstLetter: "a", secondLetter: "a")
// true

isSameLetter(firstLetter: "a", secondLetter: "b")
// false
```

<br>

### Print every factors of input number

```swift
func printDivisor(of number: Int) {
    for i in 1...number {
        if number % i == 0 {
            print(i, terminator: " ")
        }
    }
    print()
}

printDivisor(of: 10)
// 1 2 5 10

printDivisor(of: 100)
// 1 2 4 5 10 20 25 50 100 
```

<br>

### Print every common multiple of three and five below one hundred

```swift
func printCommonMultipleOfThreeAndFive() {
    for i in 1...100 {
        if (i % 3 == 0) && (i % 5 == 0) {
            print(i, terminator: " ")
        }
    }
    print()
}

printCommonMultipleOfThreeAndFive()
// 15 30 45 60 75 90 
```

<br>

### Determine the number that is prime number or not

```swift
func isPrime(number: Int) -> Bool {
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

isPrime(number: 7919)
// true

isPrime(number: 34573245731123)
// false
```

<br>

### Gets a natural number and returns the number in the order of the number in the Fibonacci sequence

```swift
func getFibonacciNumber(of number: Int) -> Int {
    var fibonacciNumbers = Array(repeating: 0, count: number)
    
    fibonacciNumbers.insert(0, at: 0)
    fibonacciNumbers.insert(1, at: 1)
    
    for i in 2..<fibonacciNumbers.count {
        fibonacciNumbers[i] = fibonacciNumbers[i - 2] + fibonacciNumbers[i - 1]
    }
    return fibonacciNumbers[number - 1]
}

getFibonacciNumber(of: 4)
// 2

getFibonacciNumber(of: 30)
// 514229
```

<br>

### Determine the year that is leap year or not

```swift
func isLeapYear(_ year: Int) -> Bool {
    if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                return true
            }
            return false
        }
        return true
    }
    return false
}

isLeapYear(200)
// false

isLeapYear(2016)
// true
```

