//
//  PresentationView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit
import AdvancedPageControl

class PresentationView: BaseView {
    
    lazy var pageControl = AdvancedPageControlView()
    lazy var objectImage = DefaultImageView(imageName: "OBJECTS")
    lazy var containerView = ContainerView()
    lazy var title = Label(title: "Task Manager", txtColor: AppTheme.current.navigationTintColor, txtFont: .Almarai.almaraiTitle, txtLines: 0, txtAlignment: .center)
    lazy var subtitle = Label(txtColor: AppTheme.current.textDescriptionColor, txtFont: .Almarai.almaraiSubtitle, txtLines: 0, txtAlignment: .center)
    lazy var continueButton = AppButton(title: "Get Started")
    
    func setup() {
        subtitle.text = "Create a unique emotional story that describes better than words"
        pageControl.drawer = ExtendedDotDrawer(
            numberOfPages: 2,
            height: 7,
            width: 7,
            space: 10.0,
            indicatorColor: AppTheme.current.buttonTint,
            dotsColor: AppTheme.current.buttonTint,
            isBordered: false,
            borderWidth: 0.0,
            indicatorBorderColor: .clear,
            indicatorBorderWidth: 0.0)
        addSubview(objectImage)
        addSubview(containerView)
        containerView.addSubviews(title, subtitle, continueButton, pageControl)
        
    }
    
    func setupConstraints() {
        objectImage.snp.makeConstraints { make in
            make.height.equalTo(174)
            make.left.equalTo(44)
            make.right.equalTo(-44)
            make.top.equalTo(163)
        }
        
        containerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(379)
        }
        
        pageControl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(32)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(119)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(24)
            make.left.equalTo(40)
            make.right.equalTo(-40)
        }
        
        continueButton.snp.makeConstraints { make in
            make.left.equalTo(62)
            make.right.equalTo(-62)
            make.bottom.equalTo(-48)
            make.height.equalTo(64)
        }
        
    }

}
