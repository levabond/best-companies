//
//  CompaniesCompaniesConfigurator.swift
//  best-companies
//
//  Created by Лев Бондаренко on 11/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import UIKit

class CompaniesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

      if let viewController = viewInput as? CompaniesViewController {
          configure(viewController: viewController)
      }
    }

    private func configure(viewController: CompaniesViewController) {

      let router = CompaniesRouter()
      router.viewController = viewController
      viewController.router = router

      let presenter = CompaniesPresenter()
      presenter.view = viewController
      presenter.router = router

      let interactor = CompaniesInteractor()
      interactor.output = presenter

      presenter.interactor = interactor
      viewController.output = presenter
    }

}
