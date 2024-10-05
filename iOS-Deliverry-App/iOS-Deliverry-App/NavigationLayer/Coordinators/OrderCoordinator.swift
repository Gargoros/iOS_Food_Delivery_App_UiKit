//
//  OrderCoordinator.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .purple
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("OnBoardingCoordinator finish")
    }
}
