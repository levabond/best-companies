//
//  CompaniesCompaniesRouter.swift
//  best-companies
//
//  Created by Лев Бондаренко on 11/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

protocol CompaniesRouterInput {
  func routeToCompany(id: String)
}

class CompaniesRouter: CompaniesRouterInput {
  weak var viewController: CompaniesViewController!
  
  func routeToCompany(id: String) {
    let destionationScene = CompanyViewController()
    
    print("id", id)
    destionationScene.companyID = id
    viewController.show(destionationScene, sender: nil)
  }
}
