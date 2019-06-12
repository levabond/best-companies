//
//  CompaniesCompaniesPresenter.swift
//  best-companies
//
//  Created by Лев Бондаренко on 11/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import Foundation

protocol CompaniesModuleInput: class {
}

class CompaniesPresenter: CompaniesModuleInput, CompaniesViewOutput, CompaniesInteractorOutput {
  weak var view: CompaniesViewInput!
  var interactor: CompaniesInteractorInput!
  var router: CompaniesRouterInput!
  
  func fetchCompanies() {
    interactor.getCompanies { [weak self] (companies) in
      DispatchQueue.main.async {
        self?.view.dispayCompanies(companies: companies)
      }
    }
  }
}
