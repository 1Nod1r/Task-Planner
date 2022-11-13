//
//  LaunchViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit
import IQKeyboardManagerSwift

class LaunchViewController: UIViewController, MainViewProtocol {
    
    typealias RootView = LaunchView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingView().continueButton.addTapGesture(tapNumber: 1, target: self, action: #selector(goNext))
    }
    
    override func loadView() {
        super.loadView()
        view = LaunchView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = false
    }

    @objc func goNext(){
        let vc = OnboardingViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .overFullScreen
        navigationController?.present(navVC, animated: true)
    }
    
    
}



