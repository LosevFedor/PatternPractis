//
//  SetterColorStyle.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 23/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

class SetterColorStyle: ColorStyleDelegate {
    var userColor: String?
    
    func setColorStyle(color: String) {
        userColor = color
    }
}
