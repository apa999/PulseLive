//
//  ItemsManager.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

class ItemsManager {
  
  static let shared = ItemsManager()
  let decoder       = JSONDecoder()
  var items         = Content(items: [])
  
  private init() {}
  
  func getItems() {
    Task {
      do {
        items = try await NetworkManager.shared.getContents()
        print(items.items.count)
      } catch {
        print(error)
      }
    }
  }
}
