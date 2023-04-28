//
//  Item.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

struct Item: Decodable {
  let id       : Int
  let title    : String
  let subtitle : String
  let date     : String     // Date format: 18/04/2013 11:48
}
