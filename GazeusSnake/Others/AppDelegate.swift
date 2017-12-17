//
//  AppDelegate.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let mainViewController = MainMenu()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        window!.rootViewController = mainViewController
        
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        if let gameScene = (window?.rootViewController as! MainMenu).gameVC?.scene{
            
            gameScene.isPaused = true
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        if let gameScene = (window?.rootViewController as! MainMenu).gameVC?.scene{
            
            gameScene.isPaused = false
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

