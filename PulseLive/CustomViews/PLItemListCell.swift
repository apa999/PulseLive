//
//  PLItemListCell.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class PLItemListCell: UITableViewCell {
  
  static let reuseID  = CellIdentifiers.plItemListCell
  let titleLabel      = PLArticleTitleLabel(textAlignment: .left, fontSize: 16)
  let subtitleLabel   = PLArticleSubtitleLabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(item: Item) {
    titleLabel.text    = item.title
    subtitleLabel.text = item.subtitle
  }
  
  private func configure() {
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    accessoryType           = .disclosureIndicator
    let padding: CGFloat    = 12
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      titleLabel.heightAnchor.constraint(equalToConstant: 20),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      subtitleLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
}
