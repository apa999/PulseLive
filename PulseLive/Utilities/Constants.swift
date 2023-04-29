//
//  Constants.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

enum NotificationNames {
  static let contentDataReady = "ContentDataReady"
  static let haveGotBody      = "HaveGotBody"
  static let failedToFindBody = "FailedToFindBody"
  static let failedToFindData = "FailedToFindData"
}

enum UserDefaultKeys {
  static let favouriteArticles = "favouriteArticles"
}

enum PresentAlertMessages {
  static let addedFavourites                = "Article saved"
  static let addedFavouritesMessage         = "This article has been saved to favourites"
  static let noFavourites                   = "No favourite articles"
  static let noFavouritesMessage            = "To save an article as a favourite, click the \'+' button in the article detail screen."
  static let failedToGetFavourites          = "Missing favourites"
  static let failedToGetFavouritesMessage   = "Failed to load favourites"
  static let failedToFindBody               = "Missing text"
  static let failedToFindBodyMessage        = "Failed to find the text for this article"
  static let failedToSaveFavourite          = "Failed to save favourite"
  static let failedToSaveFavouriteMessage   = "Unable to save this article as a favourite.\nPlease try again later."
  static let failedToRemoveFavourite        = "Failed to remove favourite"
  static let failedToRemoveFavouriteMessage = "Unable to remove this article as a favourite.\nPlease try again later."
}

enum ButtonImages {
  static let titleAscending  = "arrowtriangle.up.fill"
  static let titleDescending = "arrowtriangle.down.fill"
  static let refreshItems    = "arrow.clockwise"
}

enum CellIdentifiers {
  static let plItemListCell = "plItemListCell"
}

enum DataSourceLinks {
  static let contentListEndpoint   = "https://dynamic.pulselive.com/test/native/contentList.json"
  static let contentDetailEndpoint = "https://dynamic.pulselive.com/test/native/content/"
}

enum TitlesAndLabels {
  static let contentAsListVCTitle = "Articles"
  static let contentAsGridVCTitle = "Favourites"
}
