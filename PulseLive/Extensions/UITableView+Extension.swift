//
//  UITableView+Extension.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

import UIKit

extension UITableView {
    
  func removeExcessCells() {
    tableFooterView = UIView(frame: .zero)
  }
}
