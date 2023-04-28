//
//  ItemTestData.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

struct ItemTestData {
  
  static let itemTestDataString = """
{"id":36,"title":"Article 8","subtitle":"Article 8 subtitle with placeholder text","date":"18/04/2013 11:48"}
"""
  
  static var itemTestData: Data {
    Data(itemTestDataString.utf8)
  }
}
