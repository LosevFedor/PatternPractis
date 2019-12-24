//
//  LogInLogOut.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 28/11/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation
import UIKit

class LogInLogOut{
    
    static let standart = LogInLogOut()
    
    let userDefaults = UserDefaults.standard
    
    func logoutUserParams() {
        userDefaults.removeObject(forKey: "image")
        userDefaults.removeObject(forKey: "email")
        userDefaults.removeObject(forKey: "password")
        userDefaults.removeObject(forKey: "colorStyle")
        userDefaults.removeObject(forKey: "swithState")
    }
    
    func saveUserParams(){
        userDefaults.set(User.shared.image, forKey: "image")
        userDefaults.set(User.shared.email, forKey: "email")
        userDefaults.set(User.shared.password, forKey: "password")
        userDefaults.set(User.shared.userColorStyle, forKey: "colorStyle")
        userDefaults.set(User.shared.userSwithState, forKey: "swithState")
    }
    
    func sendRegistratedUserToHomeView() -> Bool{
        guard let _ = userDefaults.data(forKey: "image") else{ return false }
        guard let _ = userDefaults.string(forKey: "email") else{ return false}
        guard let _ = userDefaults.string(forKey: "password") else{ return false}
        
        return true
    }
}
