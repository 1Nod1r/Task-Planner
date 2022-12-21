//
//  EducationViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class EducationViewController: UIViewController, MainViewProtocol {

    typealias RootView = EducationView
    let viewModel: EducationViewModelProtocol
    let educationTableProvider = EducationTableDataProvider()
    
    init(viewModel: EducationViewModelProtocol = EducationViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
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
        SceneDelegate().makeRootVC(MainTabController())
    }

}
