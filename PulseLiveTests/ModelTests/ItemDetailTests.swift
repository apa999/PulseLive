//
//  ItemDetailTests.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import XCTest
@testable import PulseLive

final class ItemDetailTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test_CreateItemDetail() {
    let date = "18/04/2013 11:48"
    let item = Item(id: 10, title: "title", subtitle: "subtitle", body: "body", date: date)
    let sut = ItemDetail(item: item)
    
    XCTAssertEqual(sut.item.id, 10)
    XCTAssertEqual(sut.item.title, "title")
    XCTAssertEqual(sut.item.date, date)
  }
}
