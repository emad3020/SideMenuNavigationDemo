//
//  SideMenuVC.swift
//  SideMenuDemoApp
//
//  Created by Emad Asker on 8/1/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit
import Localize_Swift


class SideMenuVC: BaseViewController {

    @IBOutlet weak var changeLanguageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default
        .addObserver(self, selector: #selector(setText), name: Notification.Name(LCLLanguageChangeNotification),
                     object: nil)
    }
    

    @IBAction func changeLanguageButtonPressed(_ sender : Any) {
        sideMenuController?.hideMenu()
        
         let newLanguage = Localize.currentLanguage() == "ar" ? "en" : "ar"
            Localize.setCurrentLanguage(newLanguage)
        
        (UIApplication.shared.delegate as? AppDelegate)?.configureRootViewController()
    }
    
    
    @objc func setText() {
        
        changeLanguageButton.setTitle("changeLanguage".localized(), for: .normal) 
    }
    
    

}
