//
//  Company.swift
//  best-companies
//
//  Created by Лев Бондаренко on 10/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

struct Companies {
  let id: String
  let name: String
  
  init(id: String,
       name: String) {
    self.id = id
    self.name = name
  }
}

extension Companies: Codable {
  enum ResponseKeys: String, CodingKey {
    case id
    case name
  }
}
