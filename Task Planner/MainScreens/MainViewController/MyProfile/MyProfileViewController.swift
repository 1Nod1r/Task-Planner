//
//  MyProfileViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 16/11/22.
//

import UIKit

class MyProfileViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = MyProfileView
    
    let viewModel = MyProfileViewModel()
    let dataProvider = MyProfileDataProvider()
    
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
