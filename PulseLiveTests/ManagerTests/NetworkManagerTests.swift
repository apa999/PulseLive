//
//  NetworkManagerTests.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import XCTest
@testable import PulseLive

final class NetworkManagerTests: XCTestCase {
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
  }
  
  func test_DecodeContentData() {
    let content = try! NetworkManager.shared.getContents(from: ContentTestData.contentTestData)
    
    XCTAssertNotNil(content)
    XCTAssertEqual(content.items.count, 8)
  }
  
  func test_DecodeItemData() {
    let item = try! NetworkManager.shared.getItem(from: ItemTestData.itemTestData)
    
    XCTAssertNotNil(item)
  }
  
  func test_DecodeItemDetailData() {
    let itemDetail = try! NetworkManager.shared.getItemDetail(from: ItemDetailTestData.itemDetailTestData)
    
    XCTAssertNotNil(itemDetail)
    XCTAssertEqual(itemDetail.item.body, ItemDetailTestData.body)
  }
}
