//
//  CompaniesCompaniesViewController.swift
//  best-companies
//
//  Created by Лев Бондаренко on 11/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import UIKit

protocol CompaniesViewInput: class {
  func dispayCompanies(companies: [Company])
}

protocol CompaniesViewOutput {
  func fetchCompanies()
}

class CompaniesViewController: UITableViewController, CompaniesViewInput {
  let cellID = "ID"
  var companies: [Company] = []
  var output: CompaniesViewOutput!
  var router: CompaniesRouterInput!
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    output.fetchCompanies()
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
    navigationItem.title = "Компании"
    
    configure()
  }
  
  func configure() {
    let configurator = CompaniesModuleConfigurator()
    configurator.configureModuleForViewInput(viewInput: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func dispayCompanies(companies: [Company]) {
    self.companies = companies
    tableView.reloadData()
  }
}

extension CompaniesViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = companies[indexPath.item]

    router.routeToCompany(name: item.name)
  }
}

extension CompaniesViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
    cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
    cell.textLabel?.text = companies[indexPath.item].name
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return companies.count
  }
}
