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
    let contentAsListVC        = ContentAsListVC()
    let image                  = UIImage(systemName: "list.star")
    contentAsListVC.title      = "Content's List"
    contentAsListVC.tabBarItem = UITabBarItem(title: "List", image: image, tag: 0)
    
    return UINavigationController(rootViewController: contentAsListVC)
  }
  
  
  func createGridNC() -> UINavigationController {
    let contentAsGridVC        = ContentAsGridVC()
    let image                  = UIImage(systemName: "rectangle.grid.3x2")
    contentAsGridVC.title      = "Content's Grid"
    contentAsGridVC.tabBarItem = UITabBarItem(title: "Grid", image: image, tag: 1)
    
    return UINavigationController(rootViewController: contentAsGridVC)
  }
}
