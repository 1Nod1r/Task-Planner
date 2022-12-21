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
            make.edges.equalToSuperview()
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(126 + 32)
            make.left.equalTo(23)
            make.right.equalTo(-23)
            make.height.equalTo(50)
        }
    }
    
    
    private func createTable(){
        let table = UITableView()
        table.rowHeight = 128
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.register(TasksTableCell.self, forCellReuseIdentifier: TasksTableCell.defaultReuseIdentifier)
        containerView.addSubview(table)
        self.table = table
        
    }
    
    private func createContainerView(){
        let containerView = UIView()
        containerView.backgroundColor = AppTheme.current.containerViewBackgroundColor
        containerView.borderWidth = 1
        containerView.borderColor = AppTheme.current.containerViewBorderColor
        self.containerView = containerView
        addSubview(containerView)
    }
    
    private func createSegmentedControl(){
        let items = ["To Do","In Progress", "Completed"]
        let segmentedControl = CustomSegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = AppTheme.current.containerViewBackgroundColor
        segmentedControl.selectedSegmentTintColor = AppTheme.current.buttonTint
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.addTarget(self, action: #selector(didChangeResult), for: .valueChanged)
        self.segmentedControl = segmentedControl
        addSubview(segmentedControl)
    }
    
    @objc func didChangeResult(){
        
    }

}



