//
//  User.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 26/11/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

class User {
    
    static let shared = User()
    
    private init(){}
    
    var image: Data?
    var email: String?
    var password: String?
    
    var userColorStyle: String?
    var userInformation: String?
    
    var userSwithState: Bool?
}
