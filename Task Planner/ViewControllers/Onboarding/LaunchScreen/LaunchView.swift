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
    weak var emailTextField: AppTextField!
    weak var googleButton: VerificationButton!
    weak var appleButton: VerificationButton!
    weak var verificationStackView: StackView!
    weak var continueButton: AppButton!
    weak var passwordTextField: AppTextField!
    
    func setup() {
        let continueButton = AppButton(title: "Continue")
        let appleButton = VerificationButton(imageName: "Apple-logo", title: "Apple")
        let googleButton = VerificationButton(imageName: "Google", title: "Google")
        let verificationStackView = StackView(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 20, views: [googleButton, appleButton])
        let emailTextField = AppTextField(placeHolder: "Email")
        let passwordTextField = AppTextField(placeHolder: "Password")
        passwordTextField.textField.isSecureTextEntry = true
        let containerView = ContainerView()
        let signInTitle = Label(title: "Signin with", txtColor: AppTheme.current.textTitleColor, txtFont: UIFont(name: "Almarai-Bold", size: 21), txtLines: 1, txtAlignment: .left)
        let groupImage = DefaultImageView(imageName: "Group")
        let title = Label(title: "My Study Life", txtColor: AppTheme.current.navigationTintColor, txtFont: .Almarai.almaraiTitle, txtLines: 0, txtAlignment: .center)
        let subtitle = Label(title: "Create a unique emotional story that describes better than words", txtColor: AppTheme.current.textDescriptionColor, txtFont: .Almarai.almaraiSubtitle, txtLines: 0, txtAlignment: .center)
        self.continueButton = continueButton
        self.verificationStackView = verificationStackView
        self.appleButton = appleButton
        self.googleButton = googleButton
        self.emailTextField = emailTextField
        self.containerView = containerView
        self.signInTitle = signInTitle
        self.subtitle = subtitle
        self.title = title
        self.groupImage = groupImage
        self.passwordTextField = passwordTextField
        addSubviews(groupImage, title, subtitle, containerView)
        containerView.addSubviews(signInTitle, emailTextField, continueButton, verificationStackView, passwordTextField)
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
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-48)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(verificationStackView.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(56)
        }
        
    }
}

