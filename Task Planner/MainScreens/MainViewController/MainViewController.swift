//
//  ProfileViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 14/11/22.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {

    typealias RootView = ProfileView
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabLongPressed()
        
    }
    
    override func loadView() {
        super.loadView()
        view = ProfileView()
    }


}

extension MainViewController: MyTabControllerProtocol {
    
    func tabLongPressed() {
        let vc = ProfilePopupVCViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
    
}
