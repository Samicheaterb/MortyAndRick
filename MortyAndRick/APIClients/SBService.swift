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

  enum SBServiceError: Error {
    case failedToCreateRequest
    case failedToGetData
  }


  //whatever T is conforms to codable protocal

  public func execute<T: Codable>(
    _ request: SBRequest,//our request object
    expecting type: T.Type,//the type of object we expect back
    completion: @escaping (Result<T, Error>) -> Void) {
      //translate our SBRequest to URLRequest
      guard let urlRequest = self.request(from: request) else {
        completion(.failure(SBServiceError.failedToCreateRequest))
        return
      }
      let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
        //make sure there is data and no error otherwise error out
        guard let data = data, error == nil else {
          print("ERROR")
          completion(.failure(error ?? SBServiceError.failedToGetData))
          return
        }

        //decode response
        do {
          let json = try JSONSerialization.jsonObject(with: data)
          print(String(describing: json))
          let result = try JSONDecoder().decode(type.self, from: data)
          print("GOT TO RESULT PART")
          completion(.success(result))
        }
        catch {
          print("Caught error")
          completion(.failure(error))
        }

      }
      task.resume();


    }

  private func request(from sbRequest: SBRequest) -> URLRequest? {
    guard let url = sbRequest.url else { return nil }
    var request = URLRequest(url: url)
    request.httpMethod = sbRequest.httpMethod
    return request;
  }
}
