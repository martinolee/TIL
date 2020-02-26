//
//  User.swift
//  AlamofireExample
//
//  Created by Soohan Lee on 2020/02/21.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation

struct User: Decodable {
  let fullName: String
  let phone: String
  let birthDay: Date
  let email: String
  let creditCard: CreditCard
  let photo: String
  
  private enum CodingKeys: String, CodingKey {
    case name, surname, phone, birthday, email, photo
    case creditCard = "credit_card"
  }
  
  private enum BirthdayKeys: String, CodingKey {
    case dmy, mdy, raw
  }
  
  struct CreditCard: Decodable {
    let expiration: String
    let number: String
    let pin: Int
    let security: Int
  }
}

extension User {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let name = try container.decode(String.self, forKey: .name)
    let surname = try container.decode(String.self, forKey: .surname)
    
    self.fullName = "\(name) \(surname)"
    
    self.phone = try container.decode(String.self, forKey: .phone)
    self.email = try container.decode(String.self, forKey: .email)
    self.creditCard = try container.decode(CreditCard.self, forKey: .creditCard)
    self.photo = try container.decode(String.self, forKey: .photo)
    
    let birthdayContainer = try container.nestedContainer(keyedBy: BirthdayKeys.self, forKey: .birthday)
    let raw = try birthdayContainer.decode(Double.self, forKey: .raw)
    self.birthDay = Date(timeIntervalSince1970: raw)
  }
}
