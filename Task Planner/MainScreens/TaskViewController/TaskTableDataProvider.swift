//
//  TaskTableDataProvider.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 13/11/22.
//

import UIKit

class TaskTableDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource {

    var model: [TaskModel] = []
    
    weak var footerView: UIView!
    
    weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TasksTableCell.defaultReuseIdentifier, for: indexPath) as? TasksTableCell else { return UITableViewCell() }
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
