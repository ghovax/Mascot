//
//  AppDelegate.swift
//  Mascot
//
//  Created by Giovanni Gravili on 20/07/23.
//


import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        // hideTitleBar()
    }
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        hideTitleBar()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func hideTitleBar() {
        guard var window = NSApplication.shared.windows.first else {
            assertionFailure();
            return
        }
        
        NSApplication.shared.activate(ignoringOtherApps: true)

        window.setFrame(NSRect(x: (window.screen?.frame.width)! - 205, y: (window.screen?.frame.height)!, width: 265, height: 320), display: true)
        
        configureWindow(&window)
    }
}
