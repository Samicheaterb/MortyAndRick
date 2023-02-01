//
//  SBRequest.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import Foundation

final class SBRequest {


  private struct Constants {
    static let baseUrl = "https://rickandmortyapi.com/api"
  }

  private let endpoint: SBEndpoint

  private let pathComponents: [String]

  private let queryParameters: [URLQueryItem]

  private var urlString: String {
    var string = Constants.baseUrl
    string += "/"
    string += endpoint.rawValue

    if (!pathComponents.isEmpty) {
      string += "/"
      pathComponents.forEach({
        string += "/\($0)"
      })
    }

    if (!queryParameters.isEmpty) {
      string += "?"
      //name=value&name=value
      let argumentString = queryParameters.compactMap({
        guard let value = $0.value else {return nil}
        return "\($0.name)=\(value)"
      }).joined(separator: "&")
      string += argumentString
    }
    return string
  }

  public var url: URL? {
    return URL(string: urlString)
  }

  public let httpMethod = "GET"




  init(
    endpoint: SBEndpoint,
    pathComponents: [String] = [],
    queryParameters: [URLQueryItem] = []
      ) {
    self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
  }
}


extension SBRequest {
  static let listCharactersRequest = SBRequest(endpoint: .character)
}
