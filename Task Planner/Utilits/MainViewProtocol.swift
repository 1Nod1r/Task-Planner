//
//  MainViewProtocol.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    associatedtype RootView: UIView
}

extension MainViewProtocol where Self: UIViewController {
    func bindingView() -> RootView {
        guard let view = view as? RootView else { return RootView() }
        return view
    }
}

