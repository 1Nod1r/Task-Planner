//
//  TaskSectionHeader.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 13/11/22.
//

import UIKit

class TaskSectionHeader: UIView {

    let dateTitle = Label(title: "Due. Today, Monday 17", txtColor: .AppColors.x585A66, txtFont: UIFont(name: Almarai.almaraiBold, size: 14), txtLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(dateTitle)
        dateTitle.snp.makeConstraints { make in
            make.left.equalTo(23)
            make.right.equalTo(-53)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
