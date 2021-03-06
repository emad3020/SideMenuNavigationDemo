//
//  AppDelegate.swift
//  SideMenuDemoApp
//
//  Created by Emad Asker on 8/1/20.
//  Copyright © 2020 Emad Asker. All rights reserved.
//

import UIKit
import SideMenuSwift
import Localize_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = false
        
         configureRootViewController()
        
      return true
    }

    
    func configureRootViewController() {
        let isRTL = Localize.currentLanguage() == "ar"
        SideMenuController.preferences.basic.direction = isRTL ? .right : .left
       
        let semanticAttribute: UISemanticContentAttribute = isRTL ? .forceRightToLeft : .forceLeftToRight
        UIView.appearance().semanticContentAttribute = semanticAttribute
        UINavigationBar.appearance().semanticContentAttribute = semanticAttribute
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
          window = UIWindow(frame: UIScreen.main.bounds)
                    
        let contentViewController = mainStoryboard.instantiateViewController(identifier: "ContentNavigation")
        
        let menuViewController = mainStoryboard.instantiateViewController(identifier: "MenuNavigation") as! SideMenuVC
        /// You should set navigation base with the actual navigation controller
        menuViewController.navigationBase = (contentViewController as! BaseNavigationController)
      
          window?.rootViewController = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
          window?.makeKeyAndVisible()
    }
}

