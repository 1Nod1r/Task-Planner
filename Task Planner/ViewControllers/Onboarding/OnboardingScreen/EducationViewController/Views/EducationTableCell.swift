//
//  EducationTableCell.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class EducationTableCell: BaseTableCell, ReusableView {
    
    lazy var avatar = DefaultImageView(frame: .zero)
    lazy var title = Label(txtColor: AppTheme.current.textDescriptionColor, txtFont: UIFont(name: Almarai.almaraiBold, size: 20), txtLines: 1)
    lazy var containerView = UIView()
    let cellColor = AppTheme.current.containerViewBackgroundColor
    func setup() {
        backgroundColor = .clear
        containerView.backgroundColor = cellColor
        containerView.cornerRadius = 12
        containerView.borderWidth = 1
        addSubview(containerView)
        containerView.addSubviews(avatar, title)
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.left.equalTo(32)
            make.right.equalTo(-32)
            make.bottom.equalTo(-8)
            make.top.equalTo(8)
        }
        
        avatar.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.width.height.equalTo(64)
            make.centerY.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(avatar.snp.right).offset(12)
            make.right.equalTo(-45)
            make.centerY.equalToSuperview()
        }
    }
        
    func configure(with model: EducationModel){
        avatar.image = UIImage(named: model.avatarName)
        title.text = model.title
        containerView.borderColor = model.borderColor
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setColor(cellColor.withAlphaComponent(0.2))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setColor(cellColor)
    }

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setColor(cellColor)
    }
    
    private func setColor(_ color: UIColor){
        UIView.animate(withDuration: 0.1) {
            self.containerView.backgroundColor = color
        }
    }
    
    
}
