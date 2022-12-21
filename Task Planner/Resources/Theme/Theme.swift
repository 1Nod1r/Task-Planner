//
//  Theme.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 21/12/22.
//

import UIKit

protocol Theme {
    
    var backgroundColor: UIColor { get set }
    
    var textDescriptionColor: UIColor { get set }
    
    var lineViewColor: UIColor { get set }
    
    var textTitleColor: UIColor { get set }
    
    var containerViewBackgroundColor: UIColor { get set }
    
    var containerViewBorderColor: UIColor { get set }
    
    var buttonTint: UIColor { get set }
    
    var navigationTintColor: UIColor { get set }
    
    var taskTitleColor: UIColor { get set }
    
    var taskTimeColor: UIColor { get set }
    
    var profileBorderColor: UIColor { get set }
    
    var unselectedTabbarTint: UIColor { get set }

}
