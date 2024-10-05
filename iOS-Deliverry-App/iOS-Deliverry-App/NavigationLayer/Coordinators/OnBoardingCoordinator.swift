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
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnBoardingCoordinator {
    
    func showOnboarding() {
        var pages = [OnBoardingPartViewController]()
        
        let firstVC = OnBoardingPartViewController()
        firstVC.imageToShow =  UIImage(resource: .chickenLeg)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"
        
        let secondVC = OnBoardingPartViewController()
        secondVC.imageToShow = UIImage(resource: .shipped)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnBoardingPartViewController()
        thirdVC.imageToShow = UIImage(resource: .medal)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id."
        thirdVC.buttonText = "Next"

        let fourthVC = OnBoardingPartViewController()
        fourthVC.imageToShow = UIImage(resource: .creditCard)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa."
        fourthVC.buttonText = "Cool!"
          
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnBoardingViewPresenter(coordinator: self)
        let viewController = OnBoardingViewController(pages: pages, viewOutput: presenter )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
