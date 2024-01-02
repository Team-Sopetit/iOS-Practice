//
//  NSObject+.swift
//  iOS-Practice
//
//  Created by Woo Jye Lee on 1/2/24.
//

import Foundation

extension NSObject {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
