//
//  Response.swift
//  best-companies
//
//  Created by Лев Бондаренко on 10/06/2019.
//

public struct Response<T: Codable> {
  public let status: Int
  public let success: Bool
  public let data: [T]
  
  public init(status: Int,
              success: Bool,
              data: [T]) {
    self.status = status
    self.success = success
    self.data = data
  }
}

public struct SingleResponse<T: Codable> {
  public let status: Int
  public let success: Bool
  public let data: T
  
  public init(status: Int,
              success: Bool,
              data: T) {
    self.status = status
    self.success = success
    self.data = data
  }
}

extension SingleResponse: Codable {
  enum ResponseKeys: String, CodingKey {
    case status
    case success
    case data
  }
}
