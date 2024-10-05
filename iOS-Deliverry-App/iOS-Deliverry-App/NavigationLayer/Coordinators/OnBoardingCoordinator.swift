//
//  OnBoardingCoordinator.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

class OnBoardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    override func finish() {
        print("OnBoardingCoordinator finish")
    }
}

private extension OnBoardingCoordinator {
    
    func showOnboarding() {
        var pages = [UIViewController]()
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .gray
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .magenta
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .link
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        
        let presenter = OnBoardingViewPresenter(coordinator: self)
        let viewController = OnBoardingViewController(pages: pages, viewOutput: presenter )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
