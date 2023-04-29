//
//  UIViewController+Extension.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

extension UIViewController {
  
  func presentAlert(title: String, message: String, buttonTitle: String = "Okay") {
    let alertVC = PLAlertVC(title: title, message: message, buttonTitle: buttonTitle)
    alertVC.modalPresentationStyle  = .overFullScreen
    alertVC.modalTransitionStyle    = .crossDissolve
    present(alertVC, animated: true)
  }
}

