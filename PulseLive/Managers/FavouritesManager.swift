//
//  FavouritesManager.swift
//  PulseLive
//
//  Created by Anthony Abbott on 29/04/2023.
//

import Foundation

enum FavouritesManagerActionType {
  case add, remove
}

class FavouritesManager {
  
  static let shared = FavouritesManager()
  
  private init() {}
  
  private let defaults = UserDefaults.standard

  var favourites = [Item]()
  
  func updateWith(item: Item, actionType: FavouritesManagerActionType, completed: @escaping (PLError?) -> Void) {
    retrieveFavorites { result in
      switch result {
        case .success(var items):
          
          switch actionType {
            case .add:
              let f = items.filter{$0 == item}
              
              items.append(item)
              
            case .remove:
              items.removeAll { $0 == item }
          }
          
          completed(self.save(items: items))
          
        case .failure(let error):
          completed(error)
      }
    }
  }
  
  
  func retrieveFavorites(completed: @escaping (Result<[Item], PLError>) -> Void) {
    guard let data = defaults.object(forKey: UserDefaultKeys.favouriteArticles) as? Data else {
      completed(.success([]))
      return
    }
    
    do {
      let decoder     = JSONDecoder()
      let items       = try decoder.decode([Item].self, from: data)
      self.favourites = items
      completed(.success(items))
    } catch {
      completed(.failure(.unableToLoadFavourites))
    }
  }
  
  
  func save(items: [Item]) -> PLError? {
    do {
      let encoder = JSONEncoder()
      let encodedFavorites = try encoder.encode(items)
      defaults.set(encodedFavorites, forKey: UserDefaultKeys.favouriteArticles)
      return nil
    } catch {
      return .unableToSaveAsFavourite
    }
  }
}

