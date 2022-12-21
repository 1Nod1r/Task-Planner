//
//  MainTabController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 12/11/22.
//

import UIKit

protocol MyTabControllerProtocol: AnyObject {
    func tabLongPressed()
}


class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            generateVC(viewController: TasksViewController(viewModel: TaskViewModel()), title: "Tasks", image: UIImage(systemName: "menucard")!, selectedImage: UIImage(systemName: "menucard.fill")!),
            generateVC(viewController: MyProfileViewController(viewModel: MyProfileViewModel()), title: "Profile", image: UIImage(systemName: "person.circle")!, selectedImage: UIImage(systemName: "person.circle.fill")!),
            generateVC(viewController: UIViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!, selectedImage: UIImage(systemName: "magnifyingglass")!)
        ]
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(astroButtonItemLongPressed(_:)))
        tabBar.addGestureRecognizer(longPressRecognizer)
        setTabBarAppearance()
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage, selectedImage: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        return UINavigationController(rootViewController: viewController)
    }
    
    private func setTabBarAppearance(){
        view.backgroundColor = AppTheme.current.backgroundColor
        tabBar.backgroundColor = AppTheme.current.backgroundColor
        tabBar.unselectedItemTintColor = AppTheme.current.unselectedTabbarTint
        tabBar.tintColor = AppTheme.current.buttonTint
        let positionX: CGFloat = 10
        let positionY: CGFloat = 14
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
                                      x: positionX,
                                      y: tabBar.bounds.minY-positionY,
                                      width: width,
                                      height: height),
                                      cornerRadius: height/2)
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.white.cgColor
        roundLayer.strokeEnd = 1
        roundLayer.strokeStart = 0
        roundLayer.strokeColor = AppTheme.current.buttonTint.cgColor
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
    }
    
    
    @objc func astroButtonItemLongPressed(_ recognizer: UILongPressGestureRecognizer) {
        guard recognizer.state == .began else { return }
        guard let tabBar = recognizer.view as? UITabBar else { return }
        guard let tabBarItems = tabBar.items else { return }
        guard let viewControllers = viewControllers else { return }
        guard tabBarItems.count == viewControllers.count else { return }

        let loc = recognizer.location(in: tabBar)

        for (index, item) in tabBarItems.enumerated() {
            guard let view = item.value(forKey: "view") as? UIView else { continue }
            guard view.frame.contains(loc) else { continue }

            if let nc = viewControllers[index] as? UINavigationController {
                if let vc = nc.viewControllers.first as? MyTabControllerProtocol {
                    vc.tabLongPressed()
                }
            } else if let vc = viewControllers[index] as? MyTabControllerProtocol {
                vc.tabLongPressed()
            }

            break
        }
    }

}
