//
//  MainTabController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 12/11/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            generateVC(viewController: TasksViewController(), title: "Tasks", image: UIImage(systemName: "menucard")!, selectedImage: UIImage(systemName: "menucard.fill")!),
            generateVC(viewController: UIViewController(), title: "Profile", image: UIImage(systemName: "person.circle")!, selectedImage: UIImage(systemName: "person.circle.fill")!),
            generateVC(viewController: UIViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!, selectedImage: UIImage(systemName: "magnifyingglass")!)
        ]
        setTabBarAppearance()
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage, selectedImage: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        return UINavigationController(rootViewController: viewController)
    }
    
    private func setTabBarAppearance(){
        view.backgroundColor = .AppColors.xF5FBFF
        tabBar.backgroundColor = .AppColors.xF5FBFF
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.tintColor = .AppColors.x2FD1C5
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
        roundLayer.strokeColor = UIColor.AppColors.x2FD1C5.cgColor
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
    }
    

}
