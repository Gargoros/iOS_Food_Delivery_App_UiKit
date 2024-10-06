//
//  OnBoardingCoordinator.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit
//MARK: - Coordinator
class OnBoardingCoordinator: Coordinator {
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    override func finish() {
        print("OnBoardingCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
//MARK: - Navigation
private extension OnBoardingCoordinator {
    
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
