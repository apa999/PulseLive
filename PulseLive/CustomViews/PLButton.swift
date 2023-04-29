//
//  PLButton.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class PLButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(colour: UIColor, title: String, systemImageName: String) {
    self.init(frame: .zero)
    set(colour: colour, title: title, systemImageName: systemImageName)
  }
  
  private func configure() {
    configuration = .tinted()
    configuration?.cornerStyle = .medium
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  final func set(colour: UIColor, title: String, systemImageName: String) {
    configuration?.baseBackgroundColor = colour
    configuration?.baseForegroundColor = colour
    configuration?.title = title
    
    configuration?.image = UIImage(systemName: systemImageName)
    configuration?.imagePadding = 6
    configuration?.imagePlacement = .leading
  }
}
