//
//  TaskView.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 12/11/22.
//

import UIKit

class TaskView: BaseView {

    weak var containerView: UIView!
    weak var segmentedControl: CustomSegmentedControl!
    weak var table: UITableView!
    lazy var tableFooter = TaskSectionHeader()
    
    func setup() {
        createSegmentedControl()
        createContainerView()
        createTable()
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom).offset(16)
        }
        
        table.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
    }
    
    
    private func createTable(){
        let table = UITableView()
        table.rowHeight = 128
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.register(TasksTableCell.self, forCellReuseIdentifier: TasksTableCell.defaultReuseIdentifier)
        self.table = table
        containerView.addSubview(self.table)
    }
    
    private func createContainerView(){
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.borderWidth = 1
        containerView.borderColor = .AppColors.xE4EDFF
        self.containerView = containerView
        addSubview(containerView)
    }
    
    private func createSegmentedControl(){
        let items = ["To Do","In Progress", "Completed"]
        let segmentedControl = CustomSegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white
        segmentedControl.selectedSegmentTintColor = .AppColors.x2FD1C5
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.addTarget(self, action: #selector(didChangeResult), for: .valueChanged)
        addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(126 + 32)
            make.left.equalTo(23)
            make.right.equalTo(-23)
            make.height.equalTo(50)
        }
        self.segmentedControl = segmentedControl
    }
    
    @objc func didChangeResult(){
        
    }

}



