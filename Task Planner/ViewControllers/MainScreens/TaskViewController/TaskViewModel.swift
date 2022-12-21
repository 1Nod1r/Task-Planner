//
//  TaskViewModel.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 13/11/22.
//

import UIKit

protocol TaskViewModelProtocol {
    var model: [TaskModel] { get }
}

class TaskViewModel: TaskViewModelProtocol {
    var model: [TaskModel] = [
        .init(title: "Math", detailImage: UIImage(named: "robot")!),
        .init(title: "Geometry", detailImage: UIImage(named: "box")!),
        .init(title: "Geometry", detailImage: UIImage(named: "robot")!),
        .init(title: "Math", detailImage: UIImage(named: "box")!)
    ]
}
