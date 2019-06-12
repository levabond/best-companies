//
//  CompaniesCompaniesRouter.swift
//  best-companies
//
//  Created by Лев Бондаренко on 11/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

protocol CompaniesRouterInput {
  func routeToCompany(name: String)
}

class CompaniesRouter: CompaniesRouterInput {
  weak var viewController: CompaniesViewController!
  
  func routeToCompany(name: String) {
    let destionationScene = CompanyViewController()
    
    destionationScene.label.text = name
    viewController.show(destionationScene, sender: nil)
  }
}
