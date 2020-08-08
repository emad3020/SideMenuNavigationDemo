//
//  SideMenuVC.swift
//  SideMenuDemoApp
//
//  Created by Emad Asker on 8/1/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit
import Localize_Swift
import SideMenuSwift

class SideMenuVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
  
    public weak var navigationBase : BaseNavigationController?
  
    private lazy var dataSource = SideMenuDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        configureTableView()
        reloadTableViewData()
        
    }
    
    @IBAction func changeLanguageButtonPressed(_ sender : Any) {
        sideMenuController?.hideMenu()
        
        let newLanguage = Localize.currentLanguage() == "ar" ? "en" : "ar"
        Localize.setCurrentLanguage(newLanguage)
        
        (UIApplication.shared.delegate as? AppDelegate)?.configureRootViewController()
    }
    
    
    
    
    
    func changeLanguage() {
        sideMenuController?.hideMenu()
        
        let newLanguage = Localize.currentLanguage() == "ar" ? "en" : "ar"
        Localize.setCurrentLanguage(newLanguage)
        
        (UIApplication.shared.delegate as? AppDelegate)?.configureRootViewController()
    }
    
    
}

// MARK: - Configure View

private extension SideMenuVC {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.tableFooterView = UIView()
    }
    
    func reloadTableViewData() {
        dataSource.reloadSections()
    }
    
}

// MARK: - Configure UITableViewDelegate
//
extension SideMenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)

        switch dataSource.rows[indexPath.row].type {
        case .changeLanguage:
            changeLanguage()
        case .profile:
            let profileVC = ProfileVC()
            navigate(to: profileVC)
            
        default:
            break
        }
        
    }
    
}

// MARK: - Navigation Helpers
//
extension SideMenuVC {
  
  func navigate(to viewController: UIViewController) {
    sideMenuController?.hideMenu()
    navigationBase?.pushViewController(viewController, animated: true)
  }
  
}
