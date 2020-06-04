//
//  AppDelegate.swift
//  USB demo
//
//  Created by Iree García on 03/06/20.
//  Copyright © 2020 Iree García. All rights reserved.
//

import UIKit
import DarkLightning

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
   var port: DarkLightning.Port?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      if #available(iOS 13.0, *) {
          window?.overrideUserInterfaceStyle = .light
      }

      if let vc = window?.rootViewController as? ViewController {
         let textView = Memory<UITextView?>(initialValue: nil)
         let navigationItem = Memory<UINavigationItem?>(initialValue: nil)
         port = DevicePort(delegate: MessengerDelegate(textView: textView, navigationItem: navigationItem))
         port?.open()
         vc.setup(title: "Disconnected",
                  textView: textView,
                  header: navigationItem,
                  port: port!)
      }

      application.isIdleTimerDisabled = true
      return true
   }
}

