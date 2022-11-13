//
//  UIStackView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

extension UIStackView {
    static func attributedStack(axis: NSLayoutConstraint.Axis, distribution: Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}
