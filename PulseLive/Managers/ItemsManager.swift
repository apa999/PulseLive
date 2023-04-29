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
  var content       = Content(items: [])
  var items         = [Item]()
  var detailedItems = [Item]()
  let nc            = NotificationCenter.default
  
  enum SortedBy {
    case titleAscending, titleDescending
  }
  
  var sortedBy = SortedBy.titleDescending
  
  private init() {}
  
  func getContents() {
    Task {
      do {
        let contents = try await NetworkManager.shared.getContents()
        items = contents.items
        sortBy()
  
        DispatchQueue.main.async { [weak self] in
          guard let self else {return}
          
          nc.post(name: Notification.Name(NotificationNames.contentDataReady), object: nil)
        }
      } catch {
#warning("Implement error handling")
      }
    }
  }
  
  func getItems() throws {
    Task {
      do {
        content = try await NetworkManager.shared.getContents()
        items   = content.items
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
  
  func sortBy() {
    sortedBy = sortedBy == .titleAscending ? .titleDescending : .titleAscending
    
    switch sortedBy {
      case .titleAscending:  items = items.sorted{ $0.title < $1.title}
      case .titleDescending: items = items.sorted{ $0.title > $1.title}
    }
  }
}
