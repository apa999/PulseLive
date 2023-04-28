//
//  ItemDetailTestData.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

struct ItemDetailTestData {
  
  static let itemDetailTestDataString = """
{"item":{"id":36,"title":"Article 8","subtitle":"Article 8 subtitle with placeholder text","body":"Article 8 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Article 8","date":"18/04/2013 11:48", "body":"We few, we happy few, we band of brothers; For he to-day that sheds his blood with me Shall be my brother; be he ne'er so vile, This day shall gentle his condition; And gentlemen in England now-a-bed Shall think themselves accurs'd they were not here, And hold their manhoods cheap whiles any speaks That fought with us upon Saint Crispin's day."}}
"""
  
  static var itemDetailTestData: Data {
    Data(itemDetailTestDataString.utf8)
  }
  
  static let body = """
Article 8 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Article 8
"""
}
