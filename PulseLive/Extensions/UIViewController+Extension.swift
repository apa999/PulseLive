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
  
  func presentDefaultError() {
    let alertVC = PLAlertVC(title: "Something Went Wrong",
                            message: "We were unable to complete your task at this time. Please try again.")
    alertVC.modalPresentationStyle  = .overFullScreen
    alertVC.modalTransitionStyle    = .crossDissolve
    present(alertVC, animated: true)
  }
}

