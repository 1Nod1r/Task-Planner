//
//  UIButton + Ext.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 12/11/22.
//

import UIKit

extension UIButton {
    static func highLightedButton(title: String, textColor: UIColor, size: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont(name: Almarai.almaraiBold, size: size)
        return button
    }
    
    static func withImage(imageName: String, systemImage: Bool, tintColor: UIColor?) -> UIButton {
        let button = UIButton(type: .system)
        let image = systemImage ? UIImage(systemName: imageName) : UIImage(named: imageName)
        button.setImage(image!, for: .normal)
        button.tintColor = tintColor ?? .AppColors.xD8DEF3
        return button
    }
}
