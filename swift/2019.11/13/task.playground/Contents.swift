import Foundation

let appleLeadershipAndTheirFavoriteFruits: Dictionary<String, String> = [
                                                                         "Steve Jobs"        : "Apple",
                                                                         "Steve Wozniak"     : "Pineapple",
                                                                         "Jonathan Ive"      : "Kiwi",
                                                                         "Philip W. Schiller": "Mango",
                                                                         "Craig Federighi"   : "Fig",
                                                                         "Chris Lattner"     : "Avocado",
                                                                         "Jeff Williams"     : "Raspberry"
                                                                        ]

func getlistOfHasE(in list: Dictionary<String, String>) -> Array<String> {
    var listOfPeopleHasEInTheirFavoriteFruit = Array<String>()
    
    for (person, fruit) in list {
        let hasE = fruit.lowercased().contains("e") ? true : false
        
        if hasE {
            listOfPeopleHasEInTheirFavoriteFruit.append(person)
        }
    }
    
    return listOfPeopleHasEInTheirFavoriteFruit
}

print(getlistOfHasE(in: appleLeadershipAndTheirFavoriteFruits))



func oddGoToForwardEvenGoToBackward(numbers: Array<Int>) -> Array<Int> {
    var odds = Array<Int>()
    var evens = Array<Int>()
    
    for number in numbers {
        let isOdd = number % 2 == 1 ? true : false
        
        isOdd ? odds.append(number) : evens.append(number)
    }
    
    return odds + evens
}

oddGoToForwardEvenGoToBackward(numbers: [2, 8, 7, 1, 4, 3])



func howManyNumbers(in numbers: Array<Int>) {
    var numberCounts = Dictionary<Int, Int>()
    var countedNumbers = Array<Int>()
    
    for i in 0 ... 9 {
        numberCounts[i] = 0
    }
    
    for number in numbers {
        for compareNumber in 0 ... 9 {
            if number == compareNumber {
                numberCounts[number]! += 1
                
                if !countedNumbers.contains(number) { countedNumbers.append(number) }
            }
        }
    }
    
    var result = String()
    
    for countedNumber in countedNumbers {
        result += "Number \(countedNumber) : Counts \(numberCounts[countedNumber]!), "
    }
    
    result = String(result.dropLast(2))
    
    print(result)
}

howManyNumbers(in: [1, 3, 3, 3, 8])



func reverseNumber(of number: Int) -> Int {
    var reversedNumber = String()
    
    for chr in String(number).reversed() {
        reversedNumber += String(chr)
    }
    
    return Int(reversedNumber)!
}

reverseNumber(of: 123)
reverseNumber(of: 400000)



func isUniqueDigit(number: Int) -> Bool {
    var characterArray = Array<Character>()
    
    for chr in String(number) {
        characterArray.append(chr)
    }
    
    return characterArray.count == Array(Set(characterArray)).count
}

isUniqueDigit(number: 123456789)
isUniqueDigit(number: 111111111)



func getUniqueLetters(from letter: Array<String>) -> Array<String> {
    var uniqueLetters = Array<String>()
    
    for i in letter {
        var count = 0
        
        for j in letter {
            if i == j {
                count += 1
            }
        }
        
        if count == 1 {
            uniqueLetters.append(i)
        }
    }
    
    return uniqueLetters
}

getUniqueLetters(from: ["a", "b", "c", "a", "e", "d", "c"])



//let livingThings = [
//    "식육목": [
//        "개과": [
//            "개": [
//                "자칼",
//                "늑대",
//                "북미산 이리",
//            ],
//            "여우": [
//                "아메리카 여우",
//                "유럽 여우",
//            ],
//        ],
//        "고양이과": [
//            "고양이": [
//                "고양이",
//                "살쾡이",
//            ],
//            "표범": [
//                "사자",
//                "호랑이",
//            ],
//        ],
//    ],
//]
//
//print(livingThings["식육목"]!["고양이과"]!["표범"]!)

let livingThings = [
    "Carnivores": [
        "Canidae": [
            "Canini": [
                "Canina",
                "Cerdocyonina",
            ],
            "Urocyon": [
                "Urocyon littoralis",
                "Urocyon cinereroargenteus",
            ],
        ],
        "Felidae": [
            "Pantherinae": [
                "Neofelis",
                "Panthera",
            ],
            "Felinae": [
                "Pardofelis",
                "Catopuma",
            ],
        ],
    ],
]

print(livingThings["Carnivores"]!["Felidae"]!["Felinae"]!)
