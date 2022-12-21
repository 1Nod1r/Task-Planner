//
//  ProfilePopupVCViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 14/11/22.
//

import UIKit

class ProfilePopupVCViewController: UIViewController, MainViewProtocol {

    typealias RootView = ProfilePopup
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        super.loadView()
        view = ProfilePopup()
    }
    
}
