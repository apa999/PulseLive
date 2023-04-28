//
//  ItemTests.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import XCTest
@testable import PulseLive

final class ItemTests: XCTestCase {
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
  }
  
  func test_CreateItem() {
    let date = "18/04/2013 11:48"
    let sut  = Item(id: 0, title: "title", subtitle: "subtitle", date: date)
    
    XCTAssertEqual(sut.id, 0)
    XCTAssertEqual(sut.title, "title")
    XCTAssertEqual(sut.subtitle, "subtitle")
    XCTAssertEqual(sut.date, date)
  }
  
  func test_DecodeItemFromTestData() throws {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    let date = "18/04/2013 11:48"
    let sut  = try decoder.decode(Item.self, from: ItemTestData.itemTestData)
    
    XCTAssertEqual(sut.id, 36)
    XCTAssertEqual(sut.title, "Article 8")
    XCTAssertEqual(sut.subtitle, "Article 8 subtitle with placeholder text")
    XCTAssertEqual(sut.date, date)
  }
}
