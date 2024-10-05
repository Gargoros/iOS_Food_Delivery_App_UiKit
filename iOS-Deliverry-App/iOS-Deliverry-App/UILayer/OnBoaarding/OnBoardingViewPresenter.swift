//
//  OnBoardingViewPresenter.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import Foundation

protocol OnBoardingViewOutput: AnyObject {
    func OnboardingFinish()
}

class OnBoardingViewPresenter: OnBoardingViewOutput {
    //MARK: - Properties
    weak var coordinator: OnBoardingCoordinator!
    
    init(coordinator: OnBoardingCoordinator!) {
        self.coordinator = coordinator
    }
    func OnboardingFinish() {
        coordinator.finish()
    }
    //MARK: - Views
    
}
