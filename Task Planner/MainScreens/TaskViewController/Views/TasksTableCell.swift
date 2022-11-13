//
//  TasksTableCell.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 13/11/22.
//

import UIKit

class TasksTableCell: BaseTableCell, ReusableView {

    weak var detailImage: DefaultImageView!
    weak var title: Label!
    weak var subtitle: Label!
    weak var dateTitle: Label!
    weak var detailsButton: UIButton!
    weak var containerView: UIView!
    
    func setup() {
        createContainerView()
        createTitle()
        createSubtitle()
        createDateTitle()
        createDetailImage()
        createDetailsButton()
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.left.equalTo(23)
            make.right.equalTo(-23)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
        }
        
        detailImage.snp.makeConstraints { make in
            make.top.equalTo(13)
            make.left.equalTo(19)
            make.height.width.equalTo(15)
        }
        
        dateTitle.snp.makeConstraints { make in
            make.centerY.equalTo(detailImage)
            make.left.equalTo(detailImage.snp.right).offset(13)
            make.right.equalTo(-13)
            make.height.equalTo(18)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(6)
            make.left.equalTo(18)
            make.right.equalTo(-18)
            make.height.equalTo(19)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(3)
            make.left.equalTo(18)
            make.right.equalTo(-102)
            make.bottom.equalTo(-12)
        }
        
        detailsButton.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.height.equalTo(20)
            make.width.equalTo(5)
            make.centerY.equalToSuperview()
        }
        
    }
    
    private func createContainerView(){
        let containerView = UIView()
        containerView.cornerRadius = 12
        containerView.borderWidth = 1
        containerView.borderColor = .AppColors.x26BFBF
        self.containerView = containerView
        addSubview(self.containerView)
    }
    
    private func createDetailImage(){
        let detailImage = DefaultImageView(imageName: "")
        self.detailImage = detailImage
        containerView.addSubview(self.detailImage)
    }
    
    private func createTitle(){
        let detailTitle = Label(txtColor: .AppColors.x242736, txtFont: UIFont(name: Almarai.almaraiBold, size: 16), txtLines: 1)
        self.title = detailTitle
        containerView.addSubview(self.title)
    }
    
    private func createSubtitle(){
        let subtitle = Label(title: "Create a unique emotional story that describes better than words", txtColor: .AppColors.x585A66, txtFont: UIFont(name: Almarai.almaraiRegular, size: 12), txtLines: 0, txtAlignment: .left)
        self.subtitle = subtitle
        containerView.addSubview(self.subtitle)
    }
    
    private func createDateTitle(){
        let dateTitle = Label(title: "11:30 AM - 12:30 PM", txtColor: .AppColors.x9A9A9A.withAlphaComponent(0.9), txtFont: UIFont(name: Almarai.almaraiRegular, size: 12), txtLines: 0, txtAlignment: .left)
        self.dateTitle = dateTitle
        containerView.addSubview(self.dateTitle)
    }
    
    private func createDetailsButton(){
        let detailsButton = UIButton.withImage(imageName: "box-1", systemImage: false, tintColor: nil)
        self.detailsButton = detailsButton
        containerView.addSubview(self.detailsButton)
    }
    
    public func configure(with model: TaskModel){
        detailImage.image = model.detailImage
        title.text = model.title
    }
    
}
