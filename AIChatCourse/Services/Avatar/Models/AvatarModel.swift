//
//  AvatarModel.swift
//  AIChatCourse
//
//  Created by Juan Carlos Pazos on 02/10/25.
//

import Foundation

struct AvatarModel: Hashable {
    
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    
    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
    
    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [ AvatarModel(
            avatarId: UUID().uuidString,
            name: "Shammy",
            characterOption: .gato,
            characterAction: .llorando,
            characterLocation: .jardin,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: .now
        ),
          AvatarModel(
            avatarId: UUID().uuidString,
            name: "Fionna",
            characterOption: .gato,
            characterAction: .sentado,
            characterLocation: .casa,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: .now
          ),
          AvatarModel(
            avatarId: UUID().uuidString,
            name: "Booker",
            characterOption: .gato,
            characterAction: .jugando,
            characterLocation: .cocina,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: .now
          ),
          AvatarModel(
            avatarId: UUID().uuidString,
            name: "Lucrecia",
            characterOption: .gato,
            characterAction: .durmiendo,
            characterLocation: .recamara,
            profileImageName: Constants.randomImage,
            authorId: UUID().uuidString,
            dateCreated: .now
          )
        ]
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

enum CharacterOption: String, CaseIterable, Hashable {
    case hombre, mujer, alien, perro, gato
    
    static var `default`: Self {
        .hombre
    }
}

enum CharacterAction: String {
    case sonriendo, sentado, jugando, comiendo, bebiendo, caminando, durmiendo, comprando, trabajando, llorando
    
    static var `default`: Self {
        .sentado
    }
}

enum CharacterLocation: String {
    case casa, recamara, cocina, jardin, parque, tienda, museo, ciudad, bosque, playa, espacio
    
    static var `default`: Self {
        .museo
    }
}
