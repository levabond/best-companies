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
    
    guard let url = URL(string: "http://megakohz.bget.ru/test.php") else { return }
    
    let apiClient = APIClient()
    
    apiClient.get(path: url) { result in
      print(result)
    }
    
    print(apiClient)
  }
}
