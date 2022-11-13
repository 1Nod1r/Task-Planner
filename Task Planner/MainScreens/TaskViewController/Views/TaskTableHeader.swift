//
//  TaskTableHeader.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 13/11/22.
//

import UIKit

class TaskTableHeader: UIView {
    
    weak var tasksImage: DefaultImageView!
    weak var newTask: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(){
        let tasksImage = DefaultImageView(imageName: "tasks-1")
        self.tasksImage = tasksImage
        addSubview(tasksImage)
        tasksImage.snp.makeConstraints { make in
            make.left.equalTo(24)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(32)
        }
        
        let button = UIButton.highLightedButton(title: "+ New Task", textColor: .AppColors.x2FD1C5, size: 16)
        self.newTask = button
        addSubview(newTask)
        newTask.snp.makeConstraints { make in
            make.right.equalTo(-23)
            make.height.equalTo(19)
            make.centerY.equalToSuperview()
        }
    }
}
