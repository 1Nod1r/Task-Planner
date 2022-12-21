//
//  MyProfileViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 16/11/22.
//

import UIKit

class MyProfileViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = MyProfileView
    
    let viewModel: MyProfileViewModelProtocol
    let dataProvider = MyProfileDataProvider()
    
    init(viewModel: MyProfileViewModelProtocol = MyProfileViewModel()){
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
        view = MyProfileView()
    }
    
    private func setup(){
        dataProvider.table = bindingView().table
        dataProvider.model = viewModel.model
    }

}
