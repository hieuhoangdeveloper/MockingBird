//
//  AppDelegate.swift
//  MockingBird
//
//  Created by Kim Page on 3/6/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
  
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
     
        
    }


}

