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
  var detailedItems = [Item]()
  
  private init() {}
  
  func getItems() throws {
    Task {
      do {
        items = try await NetworkManager.shared.getContents()
      } catch {
        throw PLError.noArticlesFound
      }
    }
  }
  
  func getItemDetail(for id: Int) -> Item? {
    if let item = detailedItems.first(where: {$0.id == id }) {
      return item
    } else {
      return nil
    }
  }
  
  func addItemDetail(_ item: Item) {
    if !detailedItems.contains(where: {$0.id == item.id}) {
      detailedItems.append(item)
    }
  }
}
