//
//  OnboardingViewController.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 11/11/22.
//

import UIKit

class OnboardingViewController: UIPageViewController {
    let firstVc = PresentationViewController()
    let secondVc = EducationViewController()
    var myController: [UIViewController] = []
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .AppColors.xF5FBFF
    }
    
    private func configure(){
        myController.append(firstVc)
        myController.append(secondVc)
        guard let first = myController.first else { return }
        delegate = self
        dataSource = self
        setViewControllers([first],
                           direction: .forward,
                           animated: true)
        
        
        firstVc.moveNext = {[weak self] in
            guard let self = self else { return }
            self.setViewControllers([self.secondVc],
                               direction: .forward,
                               animated: true)
        }
    }
    
}

extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = myController.firstIndex(of: viewController), index > 0 else { return nil }
        let before = index - 1
        return myController[before]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myController.firstIndex(of: viewController), index < (myController.count - 1) else { return nil }
        let after = index + 1
        return myController[after]
    }
    
    
}
