//
//  Coordinator.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

enum CoordinatorType {
    case app
    case onBoarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    //MARK: - Properties
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate { get set }
    
    //MARK: - Methods
    func start()
    func finish()
}

extension CoordinatorProtocol {
    //MARK: - Methods
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol){
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol){
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator}
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    //MARK: - Methods
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}
