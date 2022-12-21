//
//  TaskDetail.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 25/11/22.
//

import Foundation

struct Task: Codable {
    let task: [TaskDetail]?
}

struct TaskDetail: Codable, Equatable, Hashable {
    
    let message: String
    let isProgress: Bool
    var taskData: [String: Any] {
        return [
            "message": message,
            "isProgress": isProgress
        ]
    }
}
