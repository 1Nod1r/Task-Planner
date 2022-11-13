//
//  AppTextField.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import Foundation
import UIKit


class AppTextField: UIView {
    
    lazy var textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cornerRadius = 8
        borderColor = .AppColors.xC4D7FF
        borderWidth = 1
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(){
        textField.placeholder = "Type..."
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(23)
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-23)
        }
    }
    
    
}
