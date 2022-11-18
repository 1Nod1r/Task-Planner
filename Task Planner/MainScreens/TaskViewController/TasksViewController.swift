//
//  TasksViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 12/11/22.
//

import UIKit

class TasksViewController: UIViewController, MainViewProtocol {

    typealias RootView = TaskView
    let taskTableProvider = TaskTableDataProvider()
    let viewModel = TaskVieModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
    }
    
    override func loadView() {
        super.loadView()
        view = TaskView()
    }
    
    private func configure(){
        taskTableProvider.model = viewModel.model
        taskTableProvider.tableView = bindingView().table
        taskTableProvider.footerView = bindingView().tableFooter
        bindingView().table.tableHeaderView = TaskTableHeader(frame:
                                                                CGRect(
                                                                    x: 0,
                                                                    y: 0,
                                                                    width: bindingView().frame.width,
                                                                    height: 72))
    }

    
    private func setup(){
        title = "Tasks"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.AppColors.x00394C]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "text.justify")!,
            style: .done,
            target: self,
            action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
}
