//
//  EducationView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import Foundation
import UIKit

class EducationView: BaseView {
    
    lazy var title = Label(title: "Education level", txtColor: AppTheme.current.navigationTintColor, txtFont: .Almarai.almaraiTitle, txtLines: 1, txtAlignment: .left)
    lazy var subtitle = Label(txtColor: AppTheme.current.textDescriptionColor, txtFont: .Almarai.almaraiSubtitle, txtLines: 0, txtAlignment: .left)
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 104
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.isScrollEnabled = false
        table.register(EducationTableCell.self, forCellReuseIdentifier: EducationTableCell.defaultReuseIdentifier)
        return table
    }()
    lazy var skipButton = UIButton.highLightedButton(title: "Skip", textColor: AppTheme.current.buttonTint, size: 18)
    
    func setup() {
        subtitle.text = "Create a unique emotional story that describes better than words"
        addSubviews(title, subtitle, tableView, skipButton)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(98)
            make.left.equalTo(37)
            make.height.equalTo(36)
        }
        
        subtitle.snp.makeConstraints { make in
            make.left.equalTo(37)
            make.top.equalTo(title.snp.bottom).offset(12)
            make.right.equalTo(-37)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(24)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(-88)
        }
        
        skipButton.snp.makeConstraints { make in
            make.right.equalTo(-39)
            make.bottom.equalTo(-48)
            make.height.equalTo(22)
        }
    }
}
