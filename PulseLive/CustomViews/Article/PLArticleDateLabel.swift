//
//  PLArticleDateLabel.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class PLArticleDateLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    self.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .light)
  }
  
  private func configure() {
    textColor                   = .label
    adjustsFontSizeToFitWidth   = true
    minimumScaleFactor          = 0.9
    lineBreakMode               = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
