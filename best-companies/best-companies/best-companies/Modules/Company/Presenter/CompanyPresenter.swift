//
//  CompanyCompanyPresenter.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

protocol CompanyModuleInput: class {

}

class CompanyPresenter: CompanyModuleInput, CompanyViewOutput, CompanyInteractorOutput {

    weak var view: CompanyViewInput!
    var interactor: CompanyInteractorInput!
    var router: CompanyRouterInput!

    func viewIsReady() {

    }
}
