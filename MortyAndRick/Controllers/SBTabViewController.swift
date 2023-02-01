//
//  ViewController.swift
//  MortyAndRick
//
//  Created by Sam Bruce on 2/1/23.
//

import UIKit

final class SBTabViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setUpTabs()
  }


  private func setUpTabs() {
    //create instances of all of our controllers and attache
    let charactersVC = SBCharacterController()
    let locationsVC = SBLocationViewController()
    let episodesVC = SBEpisodeViewController()
    let settingsVC = SBSettingsViewController()

    charactersVC.navigationItem.largeTitleDisplayMode = .automatic
    locationsVC.navigationItem.largeTitleDisplayMode = .automatic
    episodesVC.navigationItem.largeTitleDisplayMode = .automatic
    settingsVC.navigationItem.largeTitleDisplayMode = .automatic

    //wrap in nav controllers
    let nav1 = UINavigationController(rootViewController: charactersVC)
    let nav2 = UINavigationController(rootViewController: locationsVC)
    let nav3 = UINavigationController(rootViewController: episodesVC)
    let nav4 = UINavigationController(rootViewController: settingsVC)

    nav1.tabBarItem = UITabBarItem(title: "Characters",
                                   image: UIImage(systemName: "person"),
                                   tag: 1)
    nav2.tabBarItem = UITabBarItem(title: "Locations",
                                   image: UIImage(systemName: "globe"),
                                   tag: 2)
    nav3.tabBarItem = UITabBarItem(title: "Episodes",
                                   image: UIImage(systemName: "tv.fill"),
                                   tag: 3)
    nav4.tabBarItem = UITabBarItem(title: "Settings",
                                   image: UIImage(systemName: "gear"),
                                   tag: 4)

    //make the title bigger
    for nav in [nav1, nav2, nav3, nav4] {
      nav.navigationBar.prefersLargeTitles = true
    }


    setViewControllers(
      [nav1, nav2, nav3, nav4],
      animated: true)
  }
}

