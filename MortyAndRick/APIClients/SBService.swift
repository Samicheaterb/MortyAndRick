//
//  SBService.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import Foundation

final class SBService {
  //crate a shared instance (singleton) for everyone to share
  static let shared = SBService();
  //privatize the init so everyone is forced to use the shared
  private init() {

  }

  public func execute(_ request: SBRequest, completion: @escaping () -> Void) {

  }
}
