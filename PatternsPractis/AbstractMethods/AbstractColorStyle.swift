//
//  AbstractColorStyle.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 04/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import Foundation

enum colors: String{
    case pink, black
}

class AbstractColorStyle {
    static let shared = AbstractColorStyle()
    
    private init(){}
    
    public func getStyleColor(_ color: colors) -> ColorStyleProtocol{
        switch color {
        case .pink: return PinkStyle()
        case .black: return BlackStyle()
        }
    }
}
