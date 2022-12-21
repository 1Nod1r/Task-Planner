//
//  MyProfileTableCell.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 16/11/22.
//

import UIKit

class MyProfileTableCell: BaseTableCell, ReusableView {

    weak var image: DefaultImageView!
    weak var subtitle: Label!
    weak var title: Label!
    weak var lineView: UIView!
    weak var containerView: UIView!
    
    func setup() {
        createViews()
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.left.equalTo(48)
            make.top.equalTo(32)
            make.bottom.equalTo(-15)
            make.right.equalTo(-48)
        }
        
        lineView.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left)
            make.right.equalTo(containerView.snp.right)
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.width.equalTo(24)
            make.top.equalTo(9.8)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(image.snp.right).offset(16)
            make.right.equalTo(-71)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(4)
            make.left.equalTo(image.snp.right).offset(16)
            make.right.equalTo(-71)
        }
    }
    
    private func createViews(){
        let containerView = UIView()
        self.containerView = containerView
        addSubview(containerView)
        let lineView = UIView()
        lineView.backgroundColor = AppTheme.current.lineViewColor
        self.lineView = lineView
        addSubview(lineView)
        let image = DefaultImageView(imageName: "")
        self.image = image
        let subtitle = Label(txtColor: AppTheme.current.textDescriptionColor, txtFont: UIFont(name: Almarai.almaraiRegular, size: 12), txtLines: 1)
        self.subtitle = subtitle
        let title = Label(txtColor: AppTheme.current.textDescriptionColor, txtFont: UIFont(name: Almarai.almaraiRegular, size: 16), txtLines: 1)
        self.title = title
        self.containerView.addSubviews(image, subtitle, title, lineView)
    }
    
    func configure(with model: MyProfileModel){
        title.text = model.title
        subtitle.text = model.subtitle
        image.image = UIImage(named: model.imageName)
    }
    
}
