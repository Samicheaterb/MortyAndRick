//
//  SBEpisode.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import Foundation

struct SBEpisode: Codable {
  let id: Int
  let name: String
  let air_date: String
  let episode: String
  let characters: [String]
  let url: String
  let created: String
}
