//
//  AppTheme.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 21/12/22.
//

import UIKit

class AppTheme {
    static var current: Theme {
        return UserDefaults.isDarkTheme() ? DarkTheme() : LightTheme()
    }
}
