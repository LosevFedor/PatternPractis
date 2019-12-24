//
//  ColorStyleDelegate.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 23/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

protocol ColorStyleDelegate {
    
    var userColor: String? {get set}
    func setColorStyle(color: String)
}
