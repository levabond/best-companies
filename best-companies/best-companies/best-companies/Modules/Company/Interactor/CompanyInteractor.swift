//
//  CompanyCompanyInteractor.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

protocol CompanyInteractorInput {

}

protocol CompanyInteractorOutput: class {

}

class CompanyInteractor: CompanyInteractorInput {

    weak var output: CompanyInteractorOutput!

}
