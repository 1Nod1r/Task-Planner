//
//  BaseViewModelProtocol.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 25/11/22.
//

import Foundation

protocol BaseViewModelProtocol: AnyObject {
    var loadingDelegate: LoadingDelegate? { get set }
}
