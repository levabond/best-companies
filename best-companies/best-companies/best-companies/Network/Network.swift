//
//  Network.swift
//  best-companies
//
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}

enum APIClientError: Error {
  case noData
}

public final class APIClient {
  init() {}
  
  func get(path: URL, result: @escaping ((Result<Data>) -> Void)) {
    URLSession.shared.dataTask(with: path) { (data, response, error) in
      guard let `data` = data else {
        result(.failure(APIClientError.noData))
        return
      }
      if let `error` = error {
        result(.failure(error))
        return
      }
      result(.success(data))
    }
  }
}
