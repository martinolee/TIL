//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/*
 Basic
 */
print("\n---------- [ Basic ] ----------\n")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization

if let serializedDog = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let name = serializedDog["name"] as? String, let age = serializedDog["age"] as? Int {
    print("JSONSerialization:", Dog(name: name, age: age))
  }
}

// JSONDecoder

if let decodedDog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("JSONDecoder:", decodedDog)
}

/*
 Array
 */
print("\n---------- [ Array ] ----------\n")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
  """.data(using: .utf8)!


// JSONSerialization

if let serializedDogArr = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  var arr = [Dog]()
  for serializedDog in serializedDogArr {
    if let name = serializedDog["name"] as? String, let age = serializedDog["age"] as? Int {
      arr.append(Dog(name: name, age: age))
    }
  }
  print("JSONSerialization Dog Array:", arr)
}

// JSONDecoder

if let decodedDogArr = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  print("JSONDecoder Dog Array:", decodedDogArr)
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------\n")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization

if let serializedDogDict = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: [[String: Any]]] {
  if let serializedDogArr = serializedDogDict["data"] {
    for serializedDog in serializedDogArr {
      if let name = serializedDog["name"] as? String, let age = serializedDog["age"] as? Int {
        print("JSONSerialization Dog Dictionary:", Dog(name: name, age: age))
      }
    }
  }
}

// JSONDecoder

if let decodedDogDict = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
  print("JSONDecoder Dog Dictionary:", decodedDogDict)
}





/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}

/*
 Basic
 */
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("Decoder :", dog)
}

/*
 Array
 */
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  
  jsonObjects
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  dogs.forEach { print("Decoder :", $0) }
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
  let data = jsonObject["data"] as? [[String: Any]] {
  
  data
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
  dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
