//
//  SideMenuDataSource.swift
//  SideMenuDemoApp
//
//  Created by Ahmed M. Hassan on 8/2/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit

class SideMenuDataSource: NSObject {
  
  private(set) var rows: [Row] = []
  
}

// MARK: - UITableViewDataSource

extension SideMenuDataSource: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rows.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let reuseIdentifier = rows[indexPath.row].type.reuseIdentifier
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    configureTableViewCell(cell, at: indexPath)
    return cell
  }
  
}

// MARK: - Configure Cell

private extension SideMenuDataSource {
  
  func configureTableViewCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
    let row = rows[indexPath.row]
    cell.textLabel?.text = row.title
  }
  
}

// MARK: - Reload Sections

extension SideMenuDataSource {
  
  func reloadSections() {
    
    let home = Row(type: .home, title: "Home")
    
    let profile = Row(type: .profile, title: "Profile")
    
    let changeLanguage = Row(type: .changeLanguage, title: "changeLanguage".localized())
    
    let logout = Row(type: .logout, title: "Logout ya hamada")
    
    self.rows = [home, profile, changeLanguage, logout]
  }
  
}

// MARK: - Constants

extension SideMenuDataSource {
  
  enum RowType {
    case home
    case profile
    case changeLanguage
    case logout
    
    /// In case of multiple cells ya Emad
    var reuseIdentifier: String {
      "\(UITableViewCell.self)"
    }
  }
  
  struct Row {
    let type: RowType
    let title: String?
  }
  
}
