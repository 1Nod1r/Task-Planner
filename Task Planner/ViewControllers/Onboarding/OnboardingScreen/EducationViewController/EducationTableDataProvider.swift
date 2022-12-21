//
//  EducationTableDataProvider.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class EducationTableDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var model = [EducationModel]()
    
    var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EducationTableCell.defaultReuseIdentifier, for: indexPath) as? EducationTableCell else { return UITableViewCell() }
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
}
