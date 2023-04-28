//
//  ContentTestData.swift
//  PulseLiveTests
//
//  Created by Anthony Abbott on 28/04/2023.
//

import Foundation

struct ContentTestData {
  static let contentTestDataString = """
  {"items":[{"id":36,"title":"Article 8","subtitle":"Article 8 subtitle with placeholder text","date":"18/04/2013 11:48"},{"id":35,"title":"Article 7","subtitle":"Article 7 subtitle with placeholder text","date":"17/04/2013 11:48"},{"id":34,"title":"Article 6","subtitle":"Article 6 subtitle with placeholder text","date":"16/04/2013 11:48"},{"id":33,"title":"Article 5","subtitle":"Article 5 subtitle with placeholder text","date":"15/04/2013 11:48"},{"id":32,"title":"Article 4","subtitle":"Article 4 subtitle with placeholder text","date":"14/04/2013 11:48"},{"id":31,"title":"Article 3","subtitle":"Article 3 subtitle with placeholder text","date":"13/04/2013 11:48"},{"id":30,"title":"Article 2","subtitle":"Article 2 subtitle with placeholder text","date":"12/04/2013 11:48"},{"id":29,"title":"Article 1","subtitle":"Article 1 subtitle with placeholder text","date":"11/04/2013 11:48"}]}
  """
  
  static var contentTestData: Data {
    Data(contentTestDataString.utf8)
  }
}
