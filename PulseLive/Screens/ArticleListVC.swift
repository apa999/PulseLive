//
//  ArticleListVC.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class ArticleListVC: UIViewController {
  
  let tableView  = UITableView()
  let nc         = NotificationCenter.default
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewController()
    configureTableView()
    configureRefreshButtons()
    configureSearchController()
    configureSortButtons()
    addObservers()
    askForContents()
  }
  
  //MARK: - Handlers and Observers
  @objc func contentDataReady() {
    tableView.reloadData()
  }
  
  @objc func refreshButtonTapped() {
    ArticleManager.shared.getContents()
  }
  
  @objc func sortButtonTapped() {
    ArticleManager.shared.sortBy()
    
    let sortButtonImageName = ArticleManager.shared.sortedBy == .titleAscending ? SFImages.titleDescending : SFImages.titleAscending
    
    let sortImage  = UIImage(systemName: sortButtonImageName)
    
    navigationItem.rightBarButtonItem?.image = sortImage
    
    tableView.reloadData()
  }
  
  //MARK: - Private functions
  private func addObservers() {
    nc.addObserver(self, selector: #selector(contentDataReady), name: Notification.Name(NotificationNames.contentDataReady), object: nil)
  }
  
  private func askForContents() {
    ArticleManager.shared.getContents()
  }
  
  private func configureRefreshButtons() {
    
    let refreshImage  = UIImage(systemName: SFImages.refreshItems)
    
    let refreshButton = UIBarButtonItem(image: refreshImage,
                                        style: .plain,
                                        target: self,
                                        action: #selector(refreshButtonTapped))
    
    navigationItem.leftBarButtonItem = refreshButton
  }
  
  func configureSearchController() {
    let searchController                                    = UISearchController()
    searchController.searchResultsUpdater                   = self
    searchController.searchBar.placeholder                  = PlaceHolders.filterArticlesBy
    searchController.obscuresBackgroundDuringPresentation   = false
    navigationItem.searchController                         = searchController
  }
  
  private func configureSortButtons() {
    let sortButtonImageName = ArticleManager.shared.sortedBy == .titleAscending ? SFImages.titleDescending : SFImages.titleAscending
    
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
    title                   = TitlesAndLabels.contentAsListVCTitle
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}

//MARK: - Extensions
extension ArticleListVC: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ArticleManager.shared.items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.plItemListCell) as! PLItemListCell
    
    let item = ArticleManager.shared.items[indexPath.row]
    cell.set(item: item)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let itemDetailVC  = ItemDetailVC()
    itemDetailVC.item = ArticleManager.shared.items[indexPath.row]
    
    navigationController?.pushViewController(itemDetailVC, animated: true)
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete else { return }
    
    let itemToDelete = ArticleManager.shared.items[indexPath.row]
    ArticleManager.shared.delete(item: itemToDelete)
    tableView.deleteRows(at: [indexPath], with: .left)
  }
}

//MARK: - Search extension
extension ArticleListVC: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text, !filter.isEmpty else {
      ArticleManager.shared.clearFilter()
      tableView.reloadData()
      return
    }
    
    ArticleManager.shared.filterBy(filter.lowercased())
    tableView.reloadData()
  }
}
