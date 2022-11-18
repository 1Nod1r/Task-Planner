//
//  ReusableView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
