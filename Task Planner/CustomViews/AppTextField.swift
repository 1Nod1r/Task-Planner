//
//  AppTextField.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

protocol AppTextFieldDelegate: AnyObject {
    func textFieldDidBeginEditing(_ textField: UITextField)
    func textFieldDidEndEditing(_ textField: UITextField)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    func textFieldTextDidChange(_ textField: UITextField)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

extension AppTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { return true }
    func textFieldTextDidChange(_ textField: UITextField) {}
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { return true } 
    func textFieldDidBeginEditing(_ textField: UITextField) {}
    func textFieldDidEndEditing(_ textField: UITextField) {}
}

class AppTextField: UIView {
    
    weak var delegate: AppTextFieldDelegate?
    
    lazy var textField = UITextField()
    
    init(placeHolder: String?) {
        super.init(frame: .zero)
        cornerRadius = 8
        borderColor = AppTheme.current.lineViewColor
        borderWidth = 1
        setup(placeHolder: placeHolder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(placeHolder: String?){
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(
            string: placeHolder ?? "Type...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        textField.tintColor = .black
        textField.textColor = .black
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(23)
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-23)
        }
    }
    
    
}

extension AppTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return delegate?.textFieldShouldReturn(textField) ?? true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let delegate = delegate else { return true }
        return delegate.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
}
