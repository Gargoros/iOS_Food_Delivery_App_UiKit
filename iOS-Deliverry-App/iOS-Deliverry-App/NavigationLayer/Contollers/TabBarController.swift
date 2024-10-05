//
//  TabBarController.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarCoordinators: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarCoordinators {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar.backgroundColor = AppColors.white
        tabBar.tintColor = AppColors.accentOrange
    }
}
