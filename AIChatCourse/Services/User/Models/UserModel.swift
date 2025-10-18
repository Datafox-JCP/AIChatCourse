//
//  UserModel.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 17/10/25.
//

import SwiftUI

struct UserModel {
    
    let userId: String
    let dateCreated: Date?
    let didComplete: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didComplete: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didComplete = didComplete
        self.profileColorHex = profileColorHex
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        
        return Color(hex: profileColorHex)
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        let now = Date()
        let cal = Calendar.current
        
        let userIds  = ["u_alex", "u_bianca", "u_carlos", "u_dana"]
        let colors   = ["#FF9500", "#007AFF", "#34C759", "#AF52DE"]
        
        // Generate mock users spaced by days in creation time
        return (0..<userIds.count).map { index in
            let created = cal.date(byAdding: .day, value: -(index * 3), to: now)!
            let completed = index % 2 == 0
            
            return UserModel(
                userId: userIds[index],
                dateCreated: created,
                didComplete: completed,
                profileColorHex: colors[index % colors.count]
            )
        }
    }
}
