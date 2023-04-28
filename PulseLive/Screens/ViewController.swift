//
//  ViewController.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    ItemsManager.shared.getItems()
    print(ItemsManager.shared.items)
  }


}

