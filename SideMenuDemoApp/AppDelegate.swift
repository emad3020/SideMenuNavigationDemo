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
        // Override point for customization after application launch.
        
        
        
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
          
          let menuViewController = mainStoryboard.instantiateViewController(identifier: "MenuNavigation")
          
          let contentViewController = mainStoryboard.instantiateViewController(identifier: "ContentNavigation")
        
          window?.rootViewController = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
          window?.makeKeyAndVisible()
    }
}

