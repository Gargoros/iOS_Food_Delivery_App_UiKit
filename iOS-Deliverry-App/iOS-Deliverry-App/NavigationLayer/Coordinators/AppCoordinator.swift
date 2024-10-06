//
//  AppCoordinator.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        UserDefaults.standard.removeObject(forKey: "pastOnboarding") //MARK: - Removed that line, when app will finised
//        userStorage.pastOnboarding = false //MARK: - Removed that line, when app will finised
        if userStorage.pastOnboarding {
            showMainFlow()
        }else{
            showOnboardingFlow()
        }
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - NAVIGATION METHODS
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = SceneFactory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol){
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        case .onBoarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
