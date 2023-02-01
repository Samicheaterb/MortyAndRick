//
//  SBGetAllCharactersResponse.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import Foundation

struct SBGetAllCharactersResponse: Codable {
  struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
  }
  let info: Info
  let results: [SBCharacter]
}

