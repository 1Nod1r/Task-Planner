//
//  StartBuilder.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 18/12/22.
//

import UIKit

class StartBuilder {
    class func makeRootVC() -> UIViewController {
        if UserDefaults.getUIID() != "" {
            return OnboardingViewController()
        } else {
            return LaunchViewController(viewModel: LaunchViewModel())
        }
    }
}
