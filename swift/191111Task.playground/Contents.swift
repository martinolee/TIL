import UIKit

//  학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)

func scoreToCredit(score: Double) -> String {
    if (score >= 4.5) && (score <= 5) {
        return "A+"
    } else if (score >= 4.0) && (score <= 5) {
        return "A"
    } else if (score >= 3.5) && (score <= 5) {
        return "B+"
    } else if (score >= 3.0) && (score <= 5) {
        return "B"
    } else if (score >= 2.5) && (score <= 5) {
        return "C+"
    } else if (score >= 2.0) && (score <= 5) {
        return "C"
    } else if (score > 0.0) && (score <= 1.5) {
        return "F"
    } else {
        return "error"
    }
}

scoreToCredit(score: 4.7)

//  특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)

func numberToMonth(number: Int) -> String {
    switch number {
    case 1:
        return "Jan"
    case 2:
        return "Feb"
    case 3:
        return "Mar"
    case 4:
        return "Apr"
    case 5:
        return "May"
    case 6:
        return "Jun"
    case 7:
        return "Jul"
    case 8:
        return "Aug"
    case 9:
        return "Sep"
    case 10:
        return "Oct"
    case 11:
        return "Sep"
    case 12:
        return "Dec"
    default:
        return "This number cannot be change to month"
    }
}

numberToMonth(number: 11)

//  세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
//  (switch where clause 를 이용해 풀어볼 수 있으면 해보기)

func isPositiveNumberMultiplyOfNumbers(firstNumber: Int, secondNumber: Int, thirdNumber: Int) -> Bool {
    let multiplyOfNumbers = firstNumber * secondNumber * thirdNumber
    
    switch multiplyOfNumbers {
    case _ where multiplyOfNumbers > 0:
        return true
    default:
        return false
    }
}

isPositiveNumberMultiplyOfNumbers(firstNumber: -1, secondNumber: -1, thirdNumber: 1)

/*:
 ---
 ## Loops
 ---
 */

//  자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
//  (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//  ex) 5! = 5 x 4 x 3 x 2 x 1


func factorial(of number: Int, using loop: String) -> Int {
    var result = 1
    var i = 1
    
    switch loop {
    case "for":
        for i in i...number {
            result *= i
        }
    case "while":
        while i <= number {
            result *= i
            i += 1
        }
    case "repeat - while":
        repeat {
            result *= i
            i += 1
        } while i <= number
    default:
        print("You choose wrong loop")
        return -1
    }
    return result
}

factorial(of: 5, using: "for")
factorial(of: 5, using: "while")
factorial(of: 5, using: "repeat - while")
factorial(of: 5, using: "It's not a loop")

//  자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
//  (2, 5 를 입력한 경우 결과는 2의 5제곱)

func exponential(base: Double, exponent: Double, using loop: String) -> Double {
    var result = base
    
    var i: Double = 1
    
    if exponent == 0 {
        return 1
    }
    
    switch loop {
    case "for":
        if exponent > 0 {
            for _ in 0 ..< Int(exponent) - 1 {
                result *= base
            }
        } else if exponent < 0 {
            for _ in 0 ..< Int(-exponent) + 1 {
                result /= base
            }
        }
    case "while":
        if exponent > 0 {
            while exponent > i {
                result *= base
                i += 1
            }
        } else if exponent < 0 {
            while -exponent > i - 2 {
                result /= base
                i += 1
            }
        }
    case "repeat - while":
        if exponent > 0 {
            repeat {
                result *= base
                i += 1
            } while exponent > i
        } else if exponent < 0 {
            repeat {
                result /= base
                i += 1
            } while -exponent > i - 2
        }
    default:
        print("You choose wrong loop")
        return -1
    }
    
    return result
}

exponential(base: 2, exponent: 0, using: "for")
exponential(base: 2, exponent: 2, using: "while")
exponential(base: 2, exponent: -2, using: "repeat - while")
exponential(base: 2, exponent: 100, using: "It's not a loop")

//  자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//  (1234 인 경우 각 자리 숫자를 합치면 10)

func addPlaceValue(number: UInt) -> Int {
    var result = 0
    
    for chr in String(number) {
        result += Int(String(chr))!
    }
    return result
}

addPlaceValue(number: 1111111111)



/*:
 ---
 ## Control Transfer
 ---
 */

//  자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
//  그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수

func addBetweenOne(to number: Int) -> Int {
    var result = 0
    
    for i in 1...number {
        result += i
        if result >= 2000 {
            return result
        }
    }
    return result
}

addBetweenOne(to: 62)
addBetweenOne(to: 63)
addBetweenOne(to: 64)

//  1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수

func addBetweenOneToFiftyExceptBetweenTwentyToThirty() -> Int{
    var result = 0
    
    for i in 1...50 {
        if i >= 20 && i <= 30 {
            continue
        }
        result += i
    }
    
    return result
}

addBetweenOneToFiftyExceptBetweenTwentyToThirty()

//  두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)

func stickTwoNaturalNumber(firstNumber: Int, secondNumber: Int) -> Int {
    Int(String(firstNumber) + String(secondNumber))!
}

stickTwoNaturalNumber(firstNumber: 12, secondNumber: 34)

//  문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수

func isSameLetter(firstLetter: String, secondLetter: String) -> Bool {
    firstLetter == secondLetter
}

isSameLetter(firstLetter: "a", secondLetter: "a")
isSameLetter(firstLetter: "a", secondLetter: "b")

// 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func printDivisor(of number: Int) {
    for i in 1...number {
        if number % i == 0 {
            print(i, terminator: " ")
        }
    }
    print()
}

printDivisor(of: 10)
printDivisor(of: 100)

//  100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

func printCommonMultipleOfThreeAndFive() {
    for i in 1...100 {
        if (i % 3 == 0) && (i % 5 == 0) {
            print(i, terminator: " ")
        }
    }
    print()
}

printCommonMultipleOfThreeAndFive()

//  2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

func isPrime(number: Int) -> Bool {
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

isPrime(number: 7919)
isPrime(number: 34573245731123)

//  자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
//  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력
//        0 + 1 = 2, 1 + 2 = 3

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

//  정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
//  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
//  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
//      윤년X 예시 - 200, 300, 500, 600, 1900, 2100

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
isLeapYear(2016)
