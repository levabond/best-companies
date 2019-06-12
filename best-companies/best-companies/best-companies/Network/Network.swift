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
    var request = URLRequest(url: path)
    
    request.httpMethod = "GET"
    request.setValue("KeyGoesHere", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
    
    URLSession.shared
      .dataTask(with: path) { (data, response, error) in
        guard let `data` = data else {
          result(.failure(APIClientError.noData))
          return
        }
        
        if let `error` = error {
          result(.failure(error))
          return
        }
  
        let dataString = String(data: data, encoding: .utf8)?.replacingOccurrences(of: "\r\n|\n|\r", with: "", options: .regularExpression)
        guard let formatData = dataString?.data(using: .utf8) else {
          result(.failure(APIClientError.noData))
          return
        }
        
        do {
          try JSONSerialization.jsonObject(with: formatData, options: [])
          
          result(.success(formatData))
        } catch {
          result(.failure(APIClientError.noData))
        }
      }.resume()
  }
}
