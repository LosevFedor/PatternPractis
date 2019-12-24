//
//  IMac.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 13/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

enum ImacEnum{
    case imac21, imac27
}

struct IMac: protocolAppleDevices{
    
    typealias T = ImacEnum
    typealias U = ImacProtocol
    
    static let shared = IMac()
    
    func getAppleDevice(_ device: ImacEnum) -> ImacProtocol {
        
        switch device {
        case .imac27: return Imac27()
        case .imac21: return Imac21()
        }
    }
}
