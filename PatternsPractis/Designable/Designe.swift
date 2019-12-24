//
//  Designe.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 04/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation
import UIKit

class UISwitchCustom: UISwitch{
    @IBInspectable var offTint: UIColor?{
         didSet {
            self.tintColor = offTint
            self.layer.cornerRadius = 16
            self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}


