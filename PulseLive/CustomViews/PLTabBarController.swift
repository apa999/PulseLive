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
    viewControllers                 = [createListNC(), createGridNC()]
  }
  
  
  func createListNC() -> UINavigationController {
    let contentAsListVC        = ContentListVC()
    let image                  = UIImage(systemName: "list.star")
    contentAsListVC.title      = TitlesAndLabels.contentAsListVCTitle
    contentAsListVC.tabBarItem = UITabBarItem(title: TitlesAndLabels.contentAsListVCTitle,
                                              image: image, tag: 0)
    
    return UINavigationController(rootViewController: contentAsListVC)
  }
  
  
  func createGridNC() -> UINavigationController {
    let contentAsGridVC        = FavouriteListVC()
    let image                  = UIImage(systemName: "heart")
    contentAsGridVC.title      = TitlesAndLabels.contentAsGridVCTitle
    contentAsGridVC.tabBarItem = UITabBarItem(title: TitlesAndLabels.contentAsGridVCTitle,
                                              image: image, tag: 1)
    
    return UINavigationController(rootViewController: contentAsGridVC)
  }
}
