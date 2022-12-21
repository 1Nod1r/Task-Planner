//
//  UIViewController + Ext.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit
import ProgressHUD

extension UIViewController {
    
    func closeKeyboardOnOutsideTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )

        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    @objc public func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}


extension UIViewController {
    
    func showProgress(){
        ProgressHUD.show()
    }
    
    func hideProgress(){
        ProgressHUD.dismiss()
    }
    
    func showErrorTo(error: String?){
        ProgressHUD.showError(error ?? "Technical Issue")
    }
}
