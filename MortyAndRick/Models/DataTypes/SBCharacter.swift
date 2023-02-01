//
//  SBCharacter.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import Foundation

struct SBCharacter: Codable {
  let id: Int?
  let name: String
  let status: SBCharacterStatus
  let species: String
  let type: String
  let gender: SBCharacterGender
  let origin: SBOrigin
  let location: SBSingleLocation
  let image: String
  let episode: [String]
  let url: String
  let created: String
}

enum SBCharacterStatus: String, Codable {
  // ALIVE DeAD OR UNKNOWN
  case alive = "Alive"
  case dead = "Dead"
  case `unknown` = "unknown"
}

enum SBCharacterGender: String, Codable {
  case male = "Male"
  case female = "Female"
  case genderless = "Genderless"
  case `unknown` = "unknown"
}
