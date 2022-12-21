//
//  BaseView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

typealias BaseView = SetupView & SetupViewProtocol
typealias BaseTableCell = SetupTableCell & SetupViewProtocol
typealias BaseCollectionCell = SetupCollectionCell & SetupViewProtocol

protocol SetupViewProtocol {
    func setup()
    func setupConstraints()
}

class SetupView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = self as? BaseView else { return }
        view.backgroundColor = AppTheme.current.backgroundColor
        view.setup()
        view.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

public class SetupTableCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        guard let view = self as? BaseTableCell else {
            return
        }
        selectionStyle = .none
        self.backgroundColor = .white
        view.setup()
        view.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
}

public class SetupCollectionCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = self as? BaseCollectionCell else {
            return
        }
        view.setup()
        view.setupConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
}
