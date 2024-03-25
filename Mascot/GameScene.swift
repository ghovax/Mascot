//
//  GameScene.swift
//  Mascot
//
//  Created by Giovanni Gravili on 20/07/23.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {    
    private var mascot = Mascot()
    private var pin = Pin()
    
    private var swingingSwitch = false
    
    func spinAll() {
        mascot.spin()
        for link in self.children {
            if link.name == "single_chain_link" {
                let linkSprite = link as! SingleChainLink
                linkSprite.spin()
            }
        }
    }
    
    override func didMove(to view: SKView) {
        addChild(mascot)
        for i in 1...7 {
            let singleChainLink = SingleChainLink(givenRadius: Double(i * 20), givenSmoothingFactor: pow(Double(i) / 7, 0.05))
            addChild(singleChainLink)
        }
        addChild(pin)
        
        Timer.scheduledTimer(withTimeInterval: 600 * Double.random(in: 0.75...1.25), repeats: true) { _ in
            self.timerAction()
        }
    }
    
    func timerAction() {
        if Double.random(in: 0.0...1.0) > 0.75 {
            swingingSwitch = true
            spinAll()
        }
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 49 && !swingingSwitch {
            swingingSwitch = true
            spinAll()
        }
    }
    
    func updateAll() {
        mascot.update()
        for link in self.children {
            if link.name == "single_chain_link" {
                let linkSprite = link as! SingleChainLink
                linkSprite.update()
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if swingingSwitch {
            updateAll()
        }
        
        if abs(mascot.velocity) < 0.00001 {
            swingingSwitch = false
        }
    }
}
