//
//  TextValidationHelper.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 20/10/25.
//

import Foundation

struct TextValidationHelper {
    
    static func checkIfTextIsValid(text: String) throws {
        let minimumCHaracterCount = 4
        
        guard text.count >= minimumCHaracterCount else {
            throw TextValidationError.notEnoughCharacters(min: minimumCHaracterCount)
        }
        
        let badWords: [String] = [
            "mierda", "pendejo", "chingar"
        ]
        
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
    
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters(min: Int)
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters(min: let min):
                return "Por favor ingresa al menos \(min)  caracteres"
            case .hasBadWords:
                return "Mala palabra detectada. Por favor revisa tu mensaje."
            }
        }
    }
}
