//
//  CompanyCompanyInteractor.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import Foundation

protocol CompanyInteractorInput {
 func getCompany(id: String, company: @escaping (((company: Company, error: Error?)) -> Void))
}

protocol CompanyInteractorOutput: class {

}

class CompanyInteractor: CompanyInteractorInput {
  let apiClient = APIClient()
  weak var output: CompanyInteractorOutput!

  func getCompany(id: String, company: @escaping (((company: Company, error: Error?)) -> Void)) {
    guard let url = URL(string: "http://megakohz.bget.ru/test.php?id=\(id)") else { return }
    print(url)
    apiClient.get(path: url) { result in
      switch result {
      case .success(let data):
        do {
          let companies: [Company] = try JSONDecoder().decode([Company].self, from: data)
          let companyRes: Company = companies.first ?? Company(id: "", name: "", description: "")
          
          company((company: companyRes, error: nil))
        } catch {
          print(error)
        }
      case .failure(let error):
        company((company: Company(id: "", name: "Ошибка данных", description: ""), error: error))
      }
    }
  }
}
