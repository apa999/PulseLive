//
//  ItemDetailVC.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class ItemDetailVC: UIViewController {
  
  let nc            = NotificationCenter.default
  let scrollView    = UIScrollView()
  let contentView   = UIView()
  let titleLabel    = PLArticleTitleLabel(textAlignment: .center, fontSize: 24)
  let subtitleLabel = PLArticleSubtitleLabel(textAlignment: .center, fontSize: 22)
  let bodyLabel     = PLArticleBodyLabel(textAlignment: .left)
  let dateLabel     = PLArticleDateLabel(textAlignment: .left, fontSize: 16)
  let idLabel       = PLArticleIdLabel(textAlignment: .left, fontSize: 16)
  
  lazy var articleSubviews : [UIView] = [titleLabel, subtitleLabel, bodyLabel, dateLabel, idLabel]
  
  var item: Item!
  var itemWithBody: Item?
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    addObservers()
    configureViewController()
    configureScrollView()
    configureScreen()
    getItemDetail()
  }
  
  @objc func dismissVC() {
    dismiss(animated: true)
  }
  
  //MARK: - Handlers and Observers
  @objc func addFavouritesButtonTapped() {
    if let itemWithBody {
      FavouritesManager.shared.updateWith(item: itemWithBody, actionType: .add) { [weak self] error in
        guard let self else { return }
        
        guard let error else {
            DispatchQueue.main.async {
              self.presentAlert(title: PresentAlertMessages.addedFavourites,
                                message: PresentAlertMessages.addedFavouritesMessage)
            }
            return
        }
        DispatchQueue.main.async {
          self.presentAlert(title: PresentAlertMessages.failedToSaveFavourite,
                            message: PresentAlertMessages.failedToSaveFavouriteMessage)
        }
      }
    }
  }
  
  @objc func failedToFindBody() {
    presentAlert(title: PresentAlertMessages.failedToFindBody,
                 message: PresentAlertMessages.failedToFindBodyMessage)
    
    loadFields(item: item)
  }
  
  @objc func haveGotBody() {
    if let itemWithBody = ItemsManager.shared.getItemDetail(for: item.id) {
      self.itemWithBody = itemWithBody
      loadFields(item: itemWithBody)
    }
  }
  
  //MARK: - Private functions
  private func addObservers() {
    nc.addObserver(self, selector: #selector(haveGotBody), name: Notification.Name(NotificationNames.haveGotBody), object: nil)
    
    nc.addObserver(self, selector: #selector(failedToFindBody), name: Notification.Name(NotificationNames.failedToFindBody), object: nil)
  }
  
  private func configureScreen() {
    
    let hPadding  : CGFloat = 12
    let vPadding  : CGFloat = 20
    var lastLabel : UIView?
    
    for articleSubview in articleSubviews {
      contentView.addSubview(articleSubview)
      
      lastLabel = lastLabel == nil ? contentView : lastLabel
      
      NSLayoutConstraint.activate([
        articleSubview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: hPadding),
        
        articleSubview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -hPadding),
      ])
      lastLabel = articleSubview
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 20),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                         constant: vPadding),
      subtitleLabel.heightAnchor.constraint(equalToConstant: 20),
      
      bodyLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,
                                     constant: vPadding),
      bodyLabel.heightAnchor.constraint(equalToConstant: 80),
      
      dateLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor,
                                     constant: vPadding * 3),
      dateLabel.heightAnchor.constraint(equalToConstant: 20),
      
      idLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,
                                   constant: vPadding),
      idLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func configureScrollView() {
    view.addSubview(scrollView)
    
    scrollView.addSubview(contentView)
    scrollView.fillScreen(of: view)
    contentView.fillScreen(of: scrollView)
    
    NSLayoutConstraint.activate([
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalToConstant: 600)
    ])
  }

  private func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let addFavouritesButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFavouritesButtonTapped))
    navigationItem.rightBarButtonItem = addFavouritesButton
  }

  private func getItemDetail() {
    if let itemWithBody = ItemsManager.shared.getItemDetail(for: item.id) {
      self.itemWithBody = itemWithBody
      loadFields(item: itemWithBody)
    } else {
      ItemsManager.shared.getItemBody(for: item)
    }
  }
  
  private func loadFields(item: Item) {
    titleLabel.text     = item.title
    subtitleLabel.text  = item.subtitle
    bodyLabel.text      = item.body
    dateLabel.text      = "Date - \(item.date)"
    idLabel.text        = "Reference - \(item.id)"
  }
}
