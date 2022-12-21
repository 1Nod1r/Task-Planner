//
//  Userdefaults + Ext.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import Foundation

fileprivate let uuid = "uuid"
fileprivate let isDark = "isDark"

extension UserDefaults {
    class func saveUUID(id: String) {
        standard.set(id, forKey: uuid)
    }
    
    class func getUIID() -> String {
        return standard.string(forKey: uuid) ?? ""
    }
    
    class func removeUUID() {
        standard.removeObject(forKey: uuid)
    }
    
    static func isDarkTheme(condition: Bool){
        standard.set(condition, forKey: isDark)
    }
    
    static func isDarkTheme() -> Bool {
        return standard.bool(forKey: isDark)
    }
    
}
