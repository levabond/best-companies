//
//  CompanyCompanyViewController.swift
//  best-companies
//
//  Created by Лев Бондаренко on 12/06/2019.
//  Copyright © 2019 best-companies. All rights reserved.
//

protocol CompanyViewInput: class {
}

protocol CompanyViewOutput {
}

import UIKit

class CompanyViewController: UIViewController, CompanyViewInput {
  lazy var label: UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 100))
    label.text = "test"
    label.textAlignment = .center
    label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
    label.textColor = .black
    
    return label
  }()
  
  var output: CompanyViewOutput!

  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
  	super.init(nibName: nil, bundle: nil)
    view.backgroundColor = .white
    navigationItem?.title = "Компания"
    
    configure()
    setupViews()
  }
  
  func configure() {
    let configurator = CompaniesModuleConfigurator()
    configurator.configureModuleForViewInput(viewInput: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    view.addSubview(label)
  }
}
