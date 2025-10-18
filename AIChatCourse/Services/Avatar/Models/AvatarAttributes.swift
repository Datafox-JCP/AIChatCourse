//
//  AvatarAttributes.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 18/10/25.
//

import Foundation

enum CharacterOption: String, CaseIterable, Hashable {
    case hombre, mujer, alien, perro, gato
    
    static var `default`: Self {
        .hombre
    }
}

enum CharacterAction: String, CaseIterable, Hashable {
    case sonriendo, sentado, jugando, comiendo, bebiendo, caminando, durmiendo, comprando, trabajando, llorando
    
    static var `default`: Self {
        .sentado
    }
}

enum CharacterLocation: String, CaseIterable, Hashable {
    case casa, recamara, cocina, jardin, parque, tienda, museo, ciudad, bosque, playa, espacio
    
    static var `default`: Self {
        .museo
    }
}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation
    
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
    
    var characterDescription: String {
        "Un \(characterOption.rawValue) que está \(characterAction.rawValue) en \(characterLocation.rawValue)."
    }
}
