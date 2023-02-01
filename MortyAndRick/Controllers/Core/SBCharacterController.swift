//
//  SBCharacterController.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import UIKit

final class SBCharacterController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Characters"
    SBService.shared.execute(.listCharactersRequest,
                             expecting: SBGetAllCharactersResponse.self) { result in
      switch result {
      case .success(let model):
        print("TOTAL: " + String(model.info.count))
        print("RESULTS: " + String(model.results.count))
        print("PAGES: " + String(model.info.pages))

      case .failure(let error):
        print(String(describing: error))
      }
    }

    //      let request = SBRequest(
    //          endpoint: .character,
    //          queryParameters: [
    //            URLQueryItem(name: "name", value: "rick"),
    //            URLQueryItem(name: "status", value: "alive")
    //            ]
    //      )
    //      print (request.url);
    //        // Do any additional setup after loading the view.
    //      SBService.shared.execute(request, expecting: SBCharacter.self) { result in
    //
    //        switch result {
    //        case .success:
    //          break
    //        case .failure(let error):
    //          print(String(describing: error))
    //        }
    //      }
  }


  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */

}
