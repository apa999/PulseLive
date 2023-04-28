//
//  Item.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

// MARK: - Item
struct Item: Decodable {
  let id       : Int
  let title    : String
  let subtitle : String
  let date     : String     // Date format: 18/04/2013 11:48
  var body     : String?
  var _date    : Date {
    convertFromDateString(date)
  }
  
  init(id: Int, title: String, subtitle: String, body: String? = "", date: String) {
    self.id       = id
    self.title    = title
    self.subtitle = subtitle
    self.body     = body
    self.date     = date
  }
  
  enum CodingKeys: CodingKey {
    case id
    case title
    case subtitle
    case date
    case body
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id       = try container.decode(Int.self, forKey: .id)
    self.title    = try container.decode(String.self, forKey: .title)
    self.subtitle = try container.decode(String.self, forKey: .subtitle)
    self.body     = try container.decodeIfPresent(String.self, forKey: .body)
    self.date     = try container.decode(String.self, forKey: .date)
  }
  
  private func convertFromDateString(_ dateAsString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
    return dateFormatter.date(from: dateAsString) ?? Date.now
  }
}
