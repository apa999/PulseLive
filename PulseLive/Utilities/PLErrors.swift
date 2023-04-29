//
//  PLErrors.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

enum PLError: String, Error {
  
  case invalidEndpoint         = "Invalid URL for endpoint."
  case invalidResponse         = "Invalid response from the server."
  case invalidData             = "Invalid data received from server"
  case noArticlesFound         = "Could not find articles for this article"
  case noDetailsFound          = "Could not find details for this article"
  case unableToSaveAsFavourite = "Could not save the article to favourites"
  case unableToLoadFavourites  = "Could not retrieve favourites"
}
