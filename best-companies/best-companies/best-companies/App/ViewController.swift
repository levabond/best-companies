//
//  ViewController.swift
//  best-companies
//
//  Created by Лев Бондаренко on 10/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    guard let url = URL(string: "http://megakohz.bget.ru/test.php") else { return }
    
    let apiClient = APIClient()
    
    print("test")
    apiClient.get(path: url) { result in
      print("test")
      switch result {
      case .success(let data):
        do {
          let response = try JSONDecoder().decode(SingleResponse<Company>.self, from: data)
          
          print(response)
        } catch {
          print(error)
        }
      case .failure(let error):
        print("error", error)
      }
      
    }
    
    print(apiClient)
  }
}
