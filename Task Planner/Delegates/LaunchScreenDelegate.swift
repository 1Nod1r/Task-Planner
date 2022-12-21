//
//  LaunchScreenDelegate.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 25/11/22.
//

import Foundation

protocol LoadingDelegate: AnyObject {
    func showError(error: String?)
    func showLoading()
    func hideLoading()
}
