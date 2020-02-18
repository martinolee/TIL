//: [Previous](@previous)
import Foundation

/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

func practice1() {
  let issLocationURL = "http://api.open-notify.org/iss-now.json"
  let apiURL = URL(string: issLocationURL)!
  
  let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
    guard error == nil else { return print(error!) }
    guard let response = response as? HTTPURLResponse,
      (200..<400).contains(response.statusCode)
      else { return print("Invalid response") }
    guard let data = data else { return }
    
    if let issLocationJSONData = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
      guard
        let issLocationData = issLocationJSONData["iss_position"] as? [String: String],
        let strLatitude = issLocationData["latitude"],
        let strLongitude = issLocationData["longitude"],
        let latitude = Double(strLatitude),
        let longitude = Double(strLongitude)
        else { return }
      
      print("latitude: \(latitude), longitude: \(longitude)")
    }
  }
  dataTask.resume()
}
//practice1()


/*
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
"""

struct User {
  let id: Int
  var firstName: String
  var lastName: String
  var email: String
}

func practice2() {
  let rawData = jsonString2.data(using: .utf8)!
  
  if let jsonData = try? JSONSerialization.jsonObject(with: rawData) as? [String: [[String: Any]]] {
    
    guard let userData = jsonData["users"] else { return }
    
    for userDetail in userData {
      guard
        let id        = userDetail["id"]         as? Int,
        let email     = userDetail["email"]      as? String,
        let firstName = userDetail["first_name"] as? String,
        let lastName  = userDetail["last_name"]  as? String
        else { return }
      
      print(User(id: id, firstName: firstName, lastName: lastName, email: email))
    }
  }
}
//practice2()


/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
  let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
  
  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard error == nil else { return print(error!.localizedDescription) }
    guard
      let response = response as? HTTPURLResponse,
      (200..<300).contains(response.statusCode),
      response.mimeType == "application/json"
    else { return }
    guard let data = data else { return print("no data") }
    if let data = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
      for singleInfo in data {
        guard
          let userId = singleInfo["userId"] as? Int,
          let id = singleInfo["id"] as? Int,
          let title = singleInfo["title"] as? String,
          let body = singleInfo["body"] as? String
          else { return }
        print(Post(userId: userId, id: id, title: title, body: body))
      }
      print("all post: \(data.count)")
    }
  }
  task.resume()
}

practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


