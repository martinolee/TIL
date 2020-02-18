//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/*
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 */
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
  "name": "Orange",
  "cost": 100,
  "description": "A juicy orange"
},
{
  "name": "Apple",
  "cost": 200
},
{
  "name": "Watermelon",
  "cost": 300
},
]
""".data(using: .utf8)!


struct Fruit: Decodable {
  let name: String
  let cost: Int
  let description: String?
}

extension Fruit {
  
}

if let decodedFruits = try? decoder.decode([Fruit].self, from: jsonFruits) {
  decodedFruits
    .forEach { print($0) }
}



/*
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 */
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
  let name: String
  let reportID: Int
  let readCount: Int
  let reportDate: Date
  
  private enum CodingKeys: String, CodingKey {
    case name
    case reportID = "report_id"
    case readCount = "read_count"
    case reportDate = "report_date"
  }
}

extension Report {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try values.decode(String.self, forKey: .name)
    
    let strReportID = try values.decode(String.self, forKey: .reportID)
    reportID = Int(strReportID)!
    
    let strReadCount = try values.decode(String.self, forKey: .readCount)
    readCount = Int(strReadCount)!
    
    let strReportDate = try values.decode(String.self, forKey: .reportDate)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.locale = Locale(identifier: "ko_kr")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    reportDate = dateFormatter.date(from: strReportDate)!
  }
}

if let decodedReport = try? decoder.decode(Report.self, from: jsonReport) {
//  print(decodedReport)
}


/*
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 */

print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      { "title": "Gran Torino", "release_year": 2008 },
      { "title": "3 Idiots", "release_year": 2009 },
      { "title": "Big Fish", "release_year": 2003 },
    ]
  }
]
""".data(using: .utf8)!

struct Person: Decodable {
  let name: String
  let favoriteMovie: [Movie]
  
  private enum CodingKeys: String, CodingKey {
    case name
    case favoriteMovie = "favorite_movies"
  }
  
  struct Movie: Decodable {
    let title: String
    let releaseYear: Int
    
    private enum CodingKeys: String, CodingKey {
      case title
      case releaseYear = "release_year"
    }
  }
}

extension Person {
  init(from decoder: Decoder) throws {
    let value = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try value.decode(String.self, forKey: .name)
    favoriteMovie = try value.decode([Movie].self, forKey: .favoriteMovie)
  }
}

if let decodedPerson = try? decoder.decode([Person].self, from: jsonMovie) {
//  print(decodedPerson)
}

/*
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - https://api.github.com/search/repositories?q=user:martinolee
 - 위 URL의 user 부분을 자신의 아이디로 변경
 */

struct Repository: Decodable {
  let fullName: String
  let description: String
  let stargazersCount: Int
  let forksCount: Int
  let htmlURL: URL
  
  private enum CodingKeys: String, CodingKey {
    case items
  }
  
  private enum Items: String, CodingKey {
    case fullName = "full_name"
    case description
    case stargazerCount = "stargazers_count"
    case forksCount = "forks_count"
    case htmlURL = "html_url"
  }
}

extension Repository {
  init(from decoder: Decoder) throws {
    let value   = try decoder.container(keyedBy: CodingKeys.self)
    let items = try value.nestedContainer(keyedBy: Items.self, forKey: .items)
    let htmlURL = try items.decode(String.self, forKey: .htmlURL)
    
    fullName        = try items.decode(String.self, forKey: .fullName)
    description     = try items.decode(String.self, forKey: .description)
    stargazersCount = try items.decode(Int.self, forKey: .stargazerCount)
    forksCount      = try items.decode(Int.self, forKey: .forksCount)
    self.htmlURL    = URL(string: htmlURL)!
  }
}


func fetchGitHubRepositories() {
  let stringRepositoriesURL = "https://api.github.com/search/repositories?q=user:martinolee"
  let repositoriesURL = URL(string: stringRepositoriesURL)!
  
  let dataTask = URLSession.shared.dataTask(with: repositoriesURL) { (repositoriesData, response, error) in
    guard error == nil else { return print(error!) }
    guard let response = response as? HTTPURLResponse,
      (200..<400).contains(response.statusCode)
      else { return print("Invalid response") }
    guard let repositoriesData = repositoriesData else { return }
    
    if let decodedRepositories = try? decoder.decode([Repository].self, from: repositoriesData) {
      decodedRepositories
        .forEach { print($0) }
    } else {
      print("has not passed")
    }
  }
  dataTask.resume()
}

fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
