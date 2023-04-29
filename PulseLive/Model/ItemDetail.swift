//
//  ItemDetail.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

// MARK: - ItemDetail
struct ItemDetail: Codable, Equatable {
  let item: Item
  
  static func == (lhs: ItemDetail, rhs: ItemDetail) -> Bool {
    return lhs.item == rhs.item
  }
}


