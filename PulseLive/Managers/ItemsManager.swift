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
  var savedItems    = [Item]()
  var detailedItems = [Item]()
  var isFiltered    = false
  let nc            = NotificationCenter.default
  
  enum SortedBy {
    case titleAscending, titleDescending
  }
  
  var sortedBy = SortedBy.titleAscending
  
  private init() {}
  
  //MARK: - Public functions
  func addItemDetail(_ item: Item) {
    if !detailedItems.contains(where: {$0.id == item.id}) {
      detailedItems.append(item)
    }
  }
  
  func clearFilter() {
    isFiltered = false
    items      = savedItems
  }
  
  func filterBy(_ filter: String) {
    isFiltered  = true
    savedItems  = items
    items       = items.filter { $0.title.lowercased().contains(filter.lowercased()) }
  }
 
  func getContents() {
    Task {
      do {
        let contents = try await NetworkManager.shared.getContents()
        items        = contents.items
        savedItems   = items
        sortBy(toggle: false)
        notify(notificationName: NotificationNames.contentDataReady)
      } catch {
        notify(notificationName: NotificationNames.failedToFindData)
      }
    }
  }
  
  func getItem(for id: Int) -> Item? {
    return items.first {$0.id == id }
  }
  
  func getItemBody(for item: Item) {
    Task{
      do {
        let itemWithBody = try await NetworkManager.shared.getItemDetail(for: item.id)
        ItemsManager.shared.addItemDetail(itemWithBody)
        notify(notificationName: NotificationNames.haveGotBody)
      } catch {
        notify(notificationName: NotificationNames.failedToFindBody)
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
  
  func getItems() throws {
    Task {
      do {
        content    = try await NetworkManager.shared.getContents()
        items      = content.items
        savedItems = items
      } catch {
        throw PLError.noArticlesFound
      }
    }
  }
  
  func sortBy(toggle: Bool = true) {
    
    if toggle {
      sortedBy = sortedBy == .titleAscending ? .titleDescending : .titleAscending
    }
    
    switch sortedBy {
      case .titleAscending:  items = items.sorted{ $0.title < $1.title}
      case .titleDescending: items = items.sorted{ $0.title > $1.title}
    }
  }
  
  //MARK: - Private functions
  private func notify(notificationName: String) {
    DispatchQueue.main.async { [weak self] in
      guard let self else {return}
      
      nc.post(name: Notification.Name(notificationName), object: nil)
    }
  }
}
