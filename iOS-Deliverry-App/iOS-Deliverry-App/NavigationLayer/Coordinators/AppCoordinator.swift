//
//  AppCoordinator.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
//        showOnboardingFlow()
        showMainFlow()
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - NAVIGATION METHODS
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onBoardingCoordinator = OnBoardingCoordinator(type: .onBoarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onBoardingCoordinator)
        onBoardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        //MARK: - HOME TAB
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        //MARK: - ORDER TAB
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "house"), tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        //MARK: - LIST TAB
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "My List", image: UIImage.init(systemName: "house"), tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        //MARK: - PROFILE TAB
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "house"), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        
        let tabBarController = TabBarController(tabBarCoordinators: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol){
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
