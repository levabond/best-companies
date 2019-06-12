//
//  CompaniesCompaniesInteractor.swift
//  best-companies
//
//  Created by Лев Бондаренко on 11/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import Foundation

protocol CompaniesInteractorInput {
  func getCompanies(company: @escaping (([Companies]) -> Void))
}

protocol CompaniesInteractorOutput: class {}

class CompaniesInteractor: CompaniesInteractorInput {
  let apiClient = APIClient()
  weak var output: CompaniesInteractorOutput!
  
  func getCompanies(company: @escaping (([Companies]) -> Void)) {
    guard let url = URL(string: "http://megakohz.bget.ru/test.php") else { return }
      apiClient.get(path: url) { result in
        switch result {
        case .success(let data):
          do {
            let companies: [Companies] = try JSONDecoder().decode([Companies].self, from: data)
            
            company(companies)
          } catch {
            print(error)
          }
        case .failure(let error):
          print("error", error)
        }
      }
    }

}
