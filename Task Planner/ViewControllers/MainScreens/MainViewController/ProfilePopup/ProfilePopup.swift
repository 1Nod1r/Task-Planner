//
//  ProfilePopup.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 14/11/22.
//

import UIKit

class ProfilePopup: BaseView {
    
    
    weak var stackView: StackView!
    weak var notePadView: UIView!
    weak var reminderView: UIView!
    weak var createTaskView: UIView!
    weak var textImageView: DefaultImageView!
    weak var bulbImageView: DefaultImageView!
    weak var sectionImageView: DefaultImageView!
    weak var textTitle: Label!
    weak var bulbTitle: Label!
    weak var sectionTitle: Label!
    weak var containerView: UIView!
    
    func setup() {
        createViews()
        createTitles()
        setupImageViews()
        createStackView()
        backgroundColor = .white.withAlphaComponent(0.77)
        
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.left.equalTo(26)
            make.right.equalTo(-26)
            make.height.equalTo(166)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.right.equalToSuperview()
            make.height.equalTo(61)
        }
        
    }
    
    private func createTitles(){
        let textTitle = Label(title: "Notepad", txtColor: .AppColors.x37313C, txtFont: UIFont(name: Almarai.almaraiRegular, size: 16), txtLines: 1, txtAlignment: .left)
        let bulbTitle = Label(title: "Reminder", txtColor: .AppColors.x37313C, txtFont: UIFont(name: Almarai.almaraiRegular, size: 16), txtLines: 1, txtAlignment: .left)
        let sectionTitle = Label(title: "Create Task", txtColor: .AppColors.x37313C, txtFont: UIFont(name: Almarai.almaraiRegular, size: 16), txtLines: 1, txtAlignment: .left)
        self.textTitle = textTitle
        self.bulbTitle = bulbTitle
        self.sectionTitle = sectionTitle
        notePadView.addSubview(textTitle)
        reminderView.addSubview(bulbTitle)
        createTaskView.addSubview(sectionTitle)
    }
    
    private func setupImageViews(){
        let textImageView = DefaultImageView(imageName: "text-document")
        let bulbImageView = DefaultImageView(imageName: "bulb-on")
        let sectionImageView = DefaultImageView(imageName: "section-add")
        self.textImageView = textImageView
        self.bulbImageView = bulbImageView
        self.sectionImageView = sectionImageView
        notePadView.addSubview(textImageView)
        reminderView.addSubview(bulbImageView)
        createTaskView.addSubview(sectionImageView)
        
    }
    private func createViews(){
        let containerView = UIView()
        containerView.backgroundColor = .AppColors.xC4D7FF
        containerView.layer.cornerRadius = 24
        containerView.borderWidth = 1
        containerView.borderColor = .AppColors.xF5FBFF
        self.containerView = containerView
        addSubview(containerView)
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.borderWidth = 1
        view.borderColor = .AppColors.xC4D7FF
        self.notePadView = view
        self.reminderView = view
        self.createTaskView = view
        containerView.addSubview(createTaskView)
    }
    
    private func createStackView() {
        let stackView = StackView(axis: .horizontal, alignment: .fill, distribution: .fillEqually, spacing: 12, views: [notePadView, reminderView])
        self.stackView = stackView
        containerView.addSubview(stackView)
    }
    
}
