//
//  SBLocation.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import Foundation

struct SBLocation: Codable {
  let id: Int
  let name: String
  let type: String
  let dimension: String
  let residents: [String]
  let url: String
  let created: String
}
