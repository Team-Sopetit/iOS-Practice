//
//  RoutineEntity.swift
//  iOS-Practice
//
//  Created by Woo Jye Lee on 1/2/24.
//

import Foundation

struct RoutineEntity {
    let dateLabel: String
    let routineLabel: String
    let imageName: String
}

extension RoutineEntity {
    static func routineDummy() -> [RoutineEntity] {
        return [
            RoutineEntity(dateLabel: "5", routineLabel: "이불 개기", imageName: "apple.logo"),
            RoutineEntity(dateLabel: "5", routineLabel: "이불 개기", imageName: "apple.logo"),
            RoutineEntity(dateLabel: "5", routineLabel: "이불 개기", imageName: "apple.logo"),
            RoutineEntity(dateLabel: "5", routineLabel: "이불 개기", imageName: "apple.logo"),
            RoutineEntity(dateLabel: "5", routineLabel: "이불 개기", imageName: "apple.logo")
        ]
    }
}
