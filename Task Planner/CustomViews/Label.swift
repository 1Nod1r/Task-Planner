//
//  Label.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

class Label: UILabel {

    init(title: String? = nil, txtColor: UIColor, txtFont: UIFont?, txtLines: Int, txtAlignment: NSTextAlignment? = nil){
        super.init(frame: .zero)
        text = title ?? ""
        textColor = txtColor
        font = txtFont!
        numberOfLines = txtLines
        textAlignment = txtAlignment ?? .left
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
