//
//  CompanyCompanyViewController.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

import SnapKit

protocol CompanyViewInput: class {
  func dispay(company: Company, error: Error?)
}

protocol CompanyViewOutput {
  func fetchCompany(id: String)
}

import UIKit

class CompanyViewController: UIViewController, CompanyViewInput {
  var companyID: String = "0"
  
  lazy var scrollView: UIScrollView = {
    var scrollView = UIScrollView(frame: .zero)
    scrollView.isScrollEnabled = true
    scrollView.isUserInteractionEnabled = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = false
    scrollView.backgroundColor = .white
    scrollView.addSubview(stackView)
    
    return scrollView
  }()
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [self.nameLabel, self.descriptionLabel])
    stack.axis = .vertical
    stack.distribution = .equalSpacing
    stack.spacing = 16.0
    stack.layoutMargins = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    
    return stack
  }()
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
    label.textColor = .black
    
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
    label.textColor = .black
    label.numberOfLines = 0
    
    return label
  }()
  
  var output: CompanyViewOutput!

  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    output.fetchCompany(id: companyID)
    setupConstraints()
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
    view.addSubview(scrollView)
  }
  
  func setupConstraints() {
    scrollView.snp.makeConstraints { make in
      make.top.left.right.bottom.equalToSuperview()
      make.width.height.equalToSuperview()
    }
    
    stackView.snp.makeConstraints { make in
      make.top.left.right.width.equalTo(scrollView)
      make.bottom.equalTo(scrollView).offset(-76.0)
    }

    nameLabel.snp.makeConstraints { make in
      make.left.equalTo(stackView).offset(16.0)
      make.right.equalToSuperview().offset(-16.0)
      make.height.equalTo(50.0)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.left.equalTo(stackView).offset(16.0)
      make.right.equalToSuperview().offset(-16.0)
    }
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
