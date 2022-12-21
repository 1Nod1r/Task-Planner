//
//  AppButton.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

class AppButton: UIView {
    
    private let buttonBackground = AppTheme.current.buttonTint
    
    init(title: String){
        super.init(frame: .zero)
        backgroundColor = buttonBackground
        cornerRadius = 8
        set(label: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func set(label: String){
        let label = Label(title: label, txtColor: .white, txtFont: UIFont(name: Almarai.almaraiBold, size: 21), txtLines: 1, txtAlignment: .center)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setColor(buttonBackground.withAlphaComponent(0.6))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setColor(buttonBackground)
    }

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        setColor(buttonBackground)
    }
    
    private func setColor(_ color: UIColor){
        UIView.animate(withDuration: 0.1) {
            self.backgroundColor = color
        }
    }
    
}
