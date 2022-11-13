//
//  PresentationViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class PresentationViewController: UIViewController, MainViewProtocol {

    typealias RootView = PresentationView
    var moveNext: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    override func loadView() {
        super.loadView()
        view = PresentationView()
    }
    
    private func setup(){
        bindingView().continueButton.addTapGesture(tapNumber: 1, target: self, action: #selector(goNext))
    }
    
    @objc private func goNext(){
        moveNext?()
    }

}
