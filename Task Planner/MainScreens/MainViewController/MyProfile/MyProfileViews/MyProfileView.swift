//
//  MyProfileView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 16/11/22.
//

import UIKit

class MyProfileView: BaseView {
    
    weak var profileImage: DefaultImageView!
    weak var nameLabel: Label!
    weak var logOut: UIButton!
    weak var topStackView: StackView!
    weak var table: UITableView!
    
    func setup() {
        createTopViews()
        createStackView()
    }
    
    func setupConstraints() {
        
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(116)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(-27)
            make.left.equalTo(77)
            make.right.equalTo(-77)
        }
        
        table.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(18)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func createTopViews(){
        let image = DefaultImageView(imageName: "personImage")
        self.profileImage = image
        addSubview(image)
        let nameLabel = Label(title: "Denko Neva", txtColor: .AppColors.x2F394B, txtFont: UIFont(name: Almarai.almaraiBold, size: 20), txtLines: 1, txtAlignment: .center)
        self.nameLabel = nameLabel
        self.addSubview(nameLabel)
        let button = UIButton.highLightedButton(title: "Log out", textColor: .AppColors.x2FD1C5, size: 14)
        self.logOut = button
        
        let table = UITableView()
        table.rowHeight = 90 + 15
        table.separatorStyle = .none
        table.backgroundColor = .white
        table.isScrollEnabled = false
        table.borderColor = .AppColors.xE4EDFF
        table.borderWidth = 1
        table.register(MyProfileTableCell.self, forCellReuseIdentifier: MyProfileTableCell.defaultReuseIdentifier)
        self.table = table
        addSubview(table)
    }
    
    private func createStackView(){
        let stackView = StackView(axis: .vertical, alignment: .fill, distribution: .fillProportionally, spacing: 11, views: [nameLabel, logOut])
        self.topStackView = stackView
        self.addSubview(topStackView)
    }
    
    
    
}
