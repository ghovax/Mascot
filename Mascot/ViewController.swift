//
//  ViewController.swift
//  Mascot
//
//  Created by Giovanni Gravili on 20/07/23.
//

import Cocoa
import SpriteKit
import GameplayKit

func configureWindow(_ window: inout NSWindow) {
    window.backingType = .buffered
    window.canHide = false
    window.level = .floating
    window.isMovableByWindowBackground = false
    window.ignoresMouseEvents = true
    window.isOpaque = false
    window.titlebarAppearsTransparent = true
    window.backgroundColor = .clear
    window.hasShadow = false
    window.titleVisibility = .hidden
    
    let closeButton = window.standardWindowButton(.closeButton)!
    closeButton.isEnabled = false
    closeButton.isHidden = true
    
    let miniButton = window.standardWindowButton(.miniaturizeButton)!
    miniButton.isHidden = true
    miniButton.isEnabled = false
    
    let zoomButton = window.standardWindowButton(.zoomButton)!
    zoomButton.isHidden = true
    zoomButton.isEnabled = false
}

class ViewController: NSViewController {
    @IBOutlet var skView: SKView!
    
    override func viewWillAppear() {
        super.viewWillAppear()

        var window = view.window!
        view.shadow = nil
        
        configureWindow(&window)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.skView {
            // Load the SKScene from 'GameScene.sks'
            let scene = SKScene(fileNamed: "GameScene")
            // Set the scale mode to scale to fit the window
            scene!.backgroundColor = .clear
            
            view.allowsTransparency = true
            view.shadow = nil
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
            
            view.presentScene(scene)
        }
    }
}

