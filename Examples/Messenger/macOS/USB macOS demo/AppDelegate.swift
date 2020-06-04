//
//  AppDelegate.swift
//  USB macOS demo
//
//  Created by Iree García on 03/06/20.
//  Copyright © 2020 Iree García. All rights reserved.
//

import Cocoa
import DarkLightning

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   
   @IBOutlet weak var window: NSWindow!
   var daemon: Daemon?
   
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      NSApp.appearance = NSAppearance(named: .darkAqua)
      
      let viewController = RootViewController()
      daemon = USBDaemon(delegate: viewController, deviceDelegate: viewController)
      window.title = "Messenger"
      window.contentViewController = viewController
      window.makeKeyAndOrderFront(nil)
      daemon?.start()
   }
   
   func applicationWillTerminate(_ aNotification: Notification) {
      daemon?.stop()
   }
}

