//
//  ContainerView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class ContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cornerRadius = 24
        backgroundColor = .white
        borderColor = .AppColors.xE4EDFF
        borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

