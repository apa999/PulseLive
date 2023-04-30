//
//  PLTabBarController.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class PLTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    UITabBar.appearance().tintColor = .systemTeal
    viewControllers                 = [createListNC(), createFavouritesNC()]
  }
  
  func createListNC() -> UINavigationController {
    let contentAsListVC        = ArticleListVC()
    let image                  = UIImage(systemName: SFImages.listStar)
    contentAsListVC.title      = TitlesAndLabels.contentAsListVCTitle
    contentAsListVC.tabBarItem = UITabBarItem(title: TitlesAndLabels.contentAsListVCTitle,
                                              image: image, tag: 0)
    
    return UINavigationController(rootViewController: contentAsListVC)
  }
  
  func createFavouritesNC() -> UINavigationController {
    let contentAsFavsVC        = FavouriteListVC()
    let image                  = UIImage(systemName: SFImages.heart)
    contentAsFavsVC.title      = TitlesAndLabels.contentAsFavouritesVCTitle
    contentAsFavsVC.tabBarItem = UITabBarItem(title: TitlesAndLabels.contentAsFavouritesVCTitle,
                                              image: image, tag: 1)
    
    return UINavigationController(rootViewController: contentAsFavsVC)
  }
}
