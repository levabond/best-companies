//
//  CompaniesViewController.swift
//  best-companies
//
//  Copyright (c) 2019 Лев Бондаренко. All rights reserved.
//

import UIKit

import UIKit

class CompaniesTableView: UITableView {
  private let cellID = "ID"
  var companies: [Company?] = []
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    delegate = self
    dataSource = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CompaniesTableView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("test")
  }
}

extension CompaniesTableView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
  
    print(companies)
    cell.textLabel?.text = companies[indexPath.item]?.name
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return companies.count
  }
}
