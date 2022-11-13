//
//  GoogleButton.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

class VerificationButton: BaseView {
    lazy var googleImage = DefaultImageView(frame: .zero)
    lazy var googleTitle = Label(txtColor: .AppColors.x00394C, txtFont: UIFont(name: "Almarai-Bold", size: 18), txtLines: 1, txtAlignment: .left)
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
        googleImage.image = UIImage(named: imageName)
        googleTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        backgroundColor = .white
        cornerRadius = 12
        borderColor = .AppColors.x2FD1C5
        borderWidth = 1
        addSubviews(googleTitle, googleImage)
    }
    
    func setupConstraints() {
        googleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(29.5)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }

        googleTitle.snp.makeConstraints { make in
            make.left.equalTo(googleImage.snp.right).offset(8)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10.5)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setColor(.black.withAlphaComponent(0.2))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setColor(.white)
    }

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setColor(.white)
    }
    
    private func setColor(_ color: UIColor){
        UIView.animate(withDuration: 0.1) {
            self.backgroundColor = color
        }
    }
    
    
    
}
