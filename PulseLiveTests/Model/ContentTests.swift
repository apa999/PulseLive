//
//  ContentTests.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import XCTest
@testable import PulseLive

final class ContentTests: XCTestCase {
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
  }
  
  func test_ContentItemsCountFromTestData_ShouldBe8() {
    let content = try! NetworkManager.shared.getContents(from: ContentTestData.contentTestData)
    
    XCTAssertEqual(content.items.count, 8)
  }
}
