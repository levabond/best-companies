//
//  CompanyCompanyConfigurator.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import UIKit

class CompanyModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CompanyViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CompanyViewController) {
      let router = CompanyRouter()

      let presenter = CompanyPresenter()
      presenter.view = viewController
      presenter.router = router

      let interactor = CompanyInteractor()
      interactor.output = presenter

      presenter.interactor = interactor
      viewController.output = presenter
    }

}
