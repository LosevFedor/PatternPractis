//
//  protocolAppleDevices.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 13/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

protocol protocolAppleDevices {
    associatedtype T
    associatedtype U
    
    func getAppleDevice(_ device: T) -> U
}
