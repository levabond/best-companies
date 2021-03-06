//
//  Company.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

struct Company {
  let id: String
  let name: String
  let description: String
  
  init(id: String,
       name: String,
       description: String) {
    self.id = id
    self.name = name
    self.description = description
  }
}

extension Company: Codable {
  enum ResponseKeys: String, CodingKey {
    case id
    case name
    case description
  }
}
