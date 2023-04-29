//
//  Constants.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

enum NotificationNames {
  static let contentDataReady = "ContentDataReady"
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
