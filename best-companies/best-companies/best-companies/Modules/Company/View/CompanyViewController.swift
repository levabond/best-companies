//
//  CompanyCompanyViewController.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

protocol CompanyViewInput: class {
  func dispay(company: Company, error: Error?)
}

protocol CompanyViewOutput {
  func fetchCompany(id: String)
}

import UIKit

class CompanyViewController: UIViewController, CompanyViewInput {
  var companyID: String = "0"
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [self.nameLabel, self.descriptionLabel])
    stack.axis = .vertical
    
    return stack
  }()
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
    label.textColor = .black
    
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
    label.textColor = .black
    label.numberOfLines = 0
    
    return label
  }()
  
  var output: CompanyViewOutput!

  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    print(companyID)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    output.fetchCompany(id: companyID)
    setupConstraints()
    print(companyID)
  }

  init() {
  	super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .white
    navigationItem.title = "Компания"
    
    configure()
    setupViews()
  }
  
  func configure() {
    let configurator = CompanyModuleConfigurator()
    configurator.configureModuleForViewInput(viewInput: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    view.addSubview(stackView)
  }
  
  func setupConstraints() {
  }
  
  func dispay(company: Company, error: Error?) {
    if let `error` = error {
      nameLabel.text = error.localizedDescription
    } else {
      nameLabel.text = company.name
      descriptionLabel.text = company.description
    }
  }
}
