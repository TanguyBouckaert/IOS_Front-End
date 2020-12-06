//
//  Damiaa_Wandel_App_iOSApp.swift
//  Damiaa_Wandel_App_iOS
//
//  Created by Tanguy Bouckaert on 12/10/2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions lauchOptions: [UIApplication.LaunchOptionsKey: Any]?)-> Bool{
        
        self.window?.makeKeyAndVisible()
//        Thread.sleep(forTimeInterval: 1)
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectionSession : UISceneSession, options : UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default connection", sessionRole: connectionSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
//    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        if #available(iOS 13.0, *){
//
//        }else{
//            let window = UIWindow(frame: UIScreen.main.bounds)
//            self.window = window
//
//            if(user != nil && userSelfIdent != nil){
//                let mainstoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let newViewcontroller: UIViewController = mainstoryboard.instantiateViewController(withIdentifier: "viewcontroller") as! ViewController
//            }
//        }
//
//        return true
//    }

}

