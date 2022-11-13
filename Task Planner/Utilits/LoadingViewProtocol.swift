//
//  LoadingViewProtocol.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit
import ProgressHUD

protocol LoadingViewProtocol: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func showAlertClosure(error: String)
}

extension LoadingViewProtocol where Self: UIViewController {
    
    func showLoadingView(){
        ProgressHUD.show("Loading")
    }
    
    func hideLoadingView(){
        ProgressHUD.dismiss()
    }
}
