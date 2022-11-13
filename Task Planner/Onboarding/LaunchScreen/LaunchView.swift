//
//  LaunchView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

class LaunchView: BaseView {
    
    weak var groupImage: DefaultImageView!
    weak var title: Label!
    weak var subtitle: Label!
    weak var signInTitle: Label!
    weak var containerView: ContainerView!
    weak var textField: AppTextField!
    weak var googleButton: VerificationButton!
    weak var appleButton: VerificationButton!
    weak var verificationStackView: StackView!
    weak var continueButton: AppButton!
    weak var orTitle: Label!
    
    func setup() {
        let orTitle = Label(title: "Or", txtColor: .AppColors.x2F394B, txtFont: UIFont(name: Almarai.almaraiRegular, size: 21), txtLines: 1, txtAlignment: .center)
        let continueButton = AppButton(title: "Continue")
        let appleButton = VerificationButton(imageName: "Apple-logo", title: "Apple")
        let googleButton = VerificationButton(imageName: "Google", title: "Google")
        let verificationStackView = StackView(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 20, views: [googleButton, appleButton])
        let textField = AppTextField()
        let containerView = ContainerView()
        let signInTitle = Label(title: "Signin with", txtColor: .AppColors.x2F394B, txtFont: UIFont(name: "Almarai-Bold", size: 21), txtLines: 1, txtAlignment: .left)
        let groupImage = DefaultImageView(imageName: "Group")
        let title = Label(title: "My Study Life", txtColor: .AppColors.x00394C, txtFont: .Almarai.almaraiTitle, txtLines: 0, txtAlignment: .center)
        let subtitle = Label(title: "Create a unique emotional story that describes better than words", txtColor: .AppColors.x585A66, txtFont: .Almarai.almaraiSubtitle, txtLines: 0, txtAlignment: .center)
        self.orTitle = orTitle
        self.continueButton = continueButton
        self.verificationStackView = verificationStackView
        self.appleButton = appleButton
        self.googleButton = googleButton
        self.textField = textField
        self.containerView = containerView
        self.signInTitle = signInTitle
        self.subtitle = subtitle
        self.title = title
        self.groupImage = groupImage
        addSubviews(groupImage, title, subtitle, containerView)
        containerView.addSubviews(signInTitle, textField, continueButton, orTitle, verificationStackView)
    }
    
    func setupConstraints() {
        groupImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(97)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(113)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(groupImage.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(62)
            make.right.equalToSuperview().offset(-62)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
        containerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(subtitle.snp.bottom).offset(40)
        }
        
        signInTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.left.equalTo(24)
        }
        
        verificationStackView.snp.makeConstraints { make in
            make.top.equalTo(signInTitle.snp.bottom).offset(29)
            make.height.equalTo(64)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
                
        
        orTitle.snp.makeConstraints { make in
            make.top.equalTo(verificationStackView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(orTitle.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-48)
        }
        
        
    }
}

