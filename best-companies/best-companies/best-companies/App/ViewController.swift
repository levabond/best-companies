//
//  ViewController.swift
//  best-companies
//
//  Created by Лев Бондаренко on 10/06/2019.
//  Copyright © 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  let companiesTableView = CompaniesTableView(frame: UIScreen.main.bounds)
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    getCompanies()
  }
  
  // MARK: Setup UI
  
  func setupView() {
    view.addSubview(companiesTableView)
  }
  
  private func getCompanies() {
    guard let url = URL(string: "http://megakohz.bget.ru/test.php") else { return }
    let apiClient = APIClient()
    
    apiClient.get(path: url) { result in
      switch result {
      case .success(let data):
        do {
          let companies: [Company] = try JSONDecoder().decode([Company].self, from: data)
          
          DispatchQueue.main.async {
            self.companiesTableView.companies = companies
            self.companiesTableView.reloadData()
          }
        } catch {
          print(error)
        }
      case .failure(let error):
        print("error", error)
      }
    }
  }
}
