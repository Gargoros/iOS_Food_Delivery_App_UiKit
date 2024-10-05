//
//  UserStorage.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import Foundation

class UserStorage {
    
    static let shared = UserStorage()
    
    var pastOnboarding: Bool{
        get { UserDefaults.standard.bool(forKey: "pastOnboarding")}
        set { UserDefaults.standard.set(newValue, forKey: "pastOnboarding")}
    }
}
