//
//  Mersedes.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 15/11/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

class CarMersedes: Car {
    var name: String?
    
    init(_ nameCar: String) {
        name = nameCar
    }
    
    func showCar(_ name: String?) {
        print("this is \(String(describing: name))")
    }
}
