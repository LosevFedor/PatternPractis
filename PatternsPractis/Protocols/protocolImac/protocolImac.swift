//
//  protocolImac.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 13/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation
import UIKit

protocol ImacProtocol{
    var image: UIImage {get}
    var name: String {get}
    var shertNameDescription: String {get}
    var turboBoshDescription: String {get}
    var processorDescription: String{get}
    var ramDescription: String {get}
    var hardDriveDescription: String {get}
    var graphicsDescription: String {get}
    var portsDescription: String {get}
    var displayDescription: String {get}
    var price: String {get}
}
