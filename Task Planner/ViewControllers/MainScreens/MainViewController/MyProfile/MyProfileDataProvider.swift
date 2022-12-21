//
//  MyProfileDataProvider.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 16/11/22.
//

import UIKit


class MyProfileDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var model: [MyProfileModel] = []
    
    var table: UITableView! {
        didSet {
            table.delegate = self
            table.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileTableCell.defaultReuseIdentifier, for: indexPath) as? MyProfileTableCell else { return UITableViewCell()}
        cell.configure(with: model[indexPath.row])
        return cell
    }
}



