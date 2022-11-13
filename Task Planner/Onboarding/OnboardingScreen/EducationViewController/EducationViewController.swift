//
//  EducationViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class EducationViewController: UIViewController, MainViewProtocol {

    typealias RootView = EducationView
    let viewModel = EducationViewModel()
    let educationTableProvider = EducationTableDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        super.loadView()
        view = EducationView()
    }
    
    private func setup(){
        educationTableProvider.model = viewModel.model
        educationTableProvider.tableView = bindingView().tableView
        bindingView().skipButton.addTapGesture(tapNumber: 1, target: self, action: #selector(goToMain))
    }
    
    @objc func goToMain(){
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: MainTabController())
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

}
