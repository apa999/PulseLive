//
//  ContentAsGridVC.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class FavouriteListVC: UIViewController {

  let tableView = UITableView()
  let nc        = NotificationCenter.default
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureViewController()
    configureTableView()
    configureRefreshButtons()
    configureSortButtons()
    addObservers()
    getFavorites()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    configureSearchController()
    
    if FavouritesManager.shared.favourites.isEmpty {
      presentAlert(title: PresentAlertMessages.noFavourites,
                   message: PresentAlertMessages.noFavouritesMessage)
    } else {
      tableView.reloadData()
    }
  }
    
  //MARK: - Handlers and Observers
  @objc func contentDataReady() {
    configureSearchController()
    tableView.reloadData()
  }
  
  @objc func refreshButtonTapped() {
    
    FavouritesManager.shared.loadFavourites { [weak self] result in
        guard let self else { return }
        
        switch result {
            case .success(let favourites):
                self.updateUI(with: favourites)
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.presentAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
                }
        }
    }
  }
  
  @objc func sortButtonTapped() {
    ItemsManager.shared.sortBy()
    
    let sortButtonImageName = ItemsManager.shared.sortedBy == .titleAscending ? ButtonImages.titleDescending : ButtonImages.titleAscending
    
    let sortImage  = UIImage(systemName: sortButtonImageName)
    
    navigationItem.rightBarButtonItem?.image = sortImage
    
    tableView.reloadData()
  }
  
  //MARK: - Private functions
  private func addObservers() {
    nc.addObserver(self, selector: #selector(contentDataReady), name: Notification.Name(NotificationNames.contentDataReady), object: nil)
  }
  

  private func configureRefreshButtons() {
  
    let refreshImage  = UIImage(systemName: ButtonImages.refreshItems)
    
    let refreshButton = UIBarButtonItem(image: refreshImage,
                                     style: .plain,
                                     target: self,
                                     action: #selector(refreshButtonTapped))

    navigationItem.leftBarButtonItem = refreshButton
  }
  
  func configureSearchController() {
    if FavouritesManager.shared.favourites.isEmpty {
      navigationItem.searchController = nil
    } else if navigationItem.searchController == nil {
      let searchController                                    = UISearchController()
      searchController.searchResultsUpdater                   = self
      searchController.searchBar.placeholder                  = "Filter articles by"
      searchController.obscuresBackgroundDuringPresentation   = false
      navigationItem.searchController                         = searchController
    }
  }
  
  private func configureSortButtons() {
    let sortButtonImageName = ItemsManager.shared.sortedBy == .titleAscending ? ButtonImages.titleAscending : ButtonImages.titleDescending
    
    let sortImage  = UIImage(systemName: sortButtonImageName)
    
    let sortButton = UIBarButtonItem(image: sortImage,
                                     style: .plain,
                                     target: self,
                                     action: #selector(sortButtonTapped))

    navigationItem.rightBarButtonItem = sortButton
  }
  
  private func configureTableView() {
    view.addSubview(tableView)
    
    tableView.frame         = view.bounds
    tableView.rowHeight     = 80
    tableView.delegate      = self
    tableView.dataSource    = self
    tableView.removeExcessCells()
    
    tableView.register(PLItemListCell.self, forCellReuseIdentifier: CellIdentifiers.plItemListCell)
  }
  
  private func configureViewController() {
    view.backgroundColor    = .systemBackground
    title                   = TitlesAndLabels.contentAsGridVCTitle
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func getFavorites() {
    FavouritesManager.shared.loadFavourites { [weak self] result in
      guard let self else { return }
      
      switch result {
        case .success(let favorites):
          self.updateUI(with: favorites)
          
        case .failure:
          DispatchQueue.main.async {
            self.presentAlert(title: PresentAlertMessages.failedToGetFavourites,
                              message: PresentAlertMessages.failedToGetFavouritesMessage)
          }
      }
    }
  }
  
  private func updateUI(with favourites: [Item]) {
    if !favourites.isEmpty {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.bringSubviewToFront(self.tableView)
        }
    }
}
}

//MARK: - Extensions
extension FavouriteListVC: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FavouritesManager.shared.favourites.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.plItemListCell) as! PLItemListCell
    
    let item = FavouritesManager.shared.favourites[indexPath.row]
    cell.set(item: item)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let itemDetailVC  = ItemDetailVC()
    itemDetailVC.item = ItemsManager.shared.items[indexPath.row]
    
    navigationController?.pushViewController(itemDetailVC, animated: true)
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete else { return }
    
    FavouritesManager.shared.updateWith(item: FavouritesManager.shared.favourites[indexPath.row],
                                        actionType: .remove) { [weak self] error in
        guard let self else { return }
      
        guard let error else {
            tableView.deleteRows(at: [indexPath], with: .left)
            return
        }
        
        DispatchQueue.main.async {
          self.presentAlert(title: PresentAlertMessages.failedToRemoveFavourite,
                            message: PresentAlertMessages.failedToRemoveFavouriteMessage)
        }
    }
  }
}

//MARK: - Search extension
extension FavouriteListVC: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text, !filter.isEmpty else {
      ItemsManager.shared.clearFilter()
      tableView.reloadData()
      return
    }
    
    ItemsManager.shared.filterBy(filter.lowercased())
    tableView.reloadData()
  }
}
