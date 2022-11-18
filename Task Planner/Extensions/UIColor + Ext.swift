//
//  UIColor + Ext.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 04/11/22.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

extension UIColor {
    struct AppColors {
        static let x37313C = UIColor(hex: "37313C")
        static let x26BFBF = UIColor(hex: "26BFBF")
        static let xD8DEF3 = UIColor(hex: "D8DEF3")
        static let x242736 = UIColor(hex: "242736")
        static let xFDD563 = UIColor(hex: "FDD563")
        static let x8BE38B = UIColor(hex: "8BE38B")
        static let xB3B4F7 = UIColor(hex: "B3B4F7")
        static let xC4D7FF = UIColor(hex: "C4D7FF")
        static let xE48FFF = UIColor(hex: "E48FFF")
        static let xF5FBFF = UIColor(hex: "F5FBFF")
        static let x2FD1C5 = UIColor(hex: "2FD1C5")
        static let x00394C = UIColor(hex: "00394C")
        static let x585A66 = UIColor(hex: "585A66")
        static let xE4EDFF = UIColor(hex: "E4EDFF")
        static let x2F394B = UIColor(hex: "2F394B")
        static let x9A9A9A = UIColor(hex: "9A9A9A")
    }
}
