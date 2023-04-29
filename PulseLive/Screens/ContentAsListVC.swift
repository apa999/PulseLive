//
//  ContentAsListVC.swift
//  PulseLive
//
//  Created by Anthony Abbott on 28/04/2023.
//

import UIKit

class ContentAsListVC: UIViewController {
  
  let tableView      = UITableView()
  var items : [Item] = []
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    getContents()
  }
  
  //MARK: - Private functions
  func configureTableView() {
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
  
  private func getContents() {
    Task {
      do {
        let contents = try await NetworkManager.shared.getContents()
        items = contents.items
  
        DispatchQueue.main.async { [weak self] in
          guard let self else {return}
          self.tableView.reloadData()
          self.view.bringSubviewToFront(self.tableView)
        }
      } catch {
#warning("Implement error handling")
      }
    }
  }
  
}

//MARK: - Extensions
extension ContentAsListVC: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.plItemListCell) as! PLItemListCell
    
    let item = items[indexPath.row]
    cell.set(item: item)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let itemDetailVC  = ItemDetailVC()
    itemDetailVC.item = items[indexPath.row]
    
    navigationController?.pushViewController(itemDetailVC, animated: true)
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete else { return }
  }
}
