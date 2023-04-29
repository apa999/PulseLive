//
//  PLArticleBodyLabel.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class PLArticleBodyLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat = 18) {
    self.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
  }
  
  private func configure() {
    backgroundColor                     = .systemBackground
    textColor                           = .label
    adjustsFontForContentSizeCategory   = true
    adjustsFontSizeToFitWidth           = true
    minimumScaleFactor                  = 0.75
    numberOfLines                       = 0
    lineBreakMode                       = .byWordWrapping
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
