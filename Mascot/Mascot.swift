//
//  ClickableMascot.swift
//  Mascot
//
//  Created by Giovanni Gravili on 20/07/23.
//

import SpriteKit

class Mascot : SKSpriteNode {
    var acceleration = 0.0
    var angle = 0.0
    var velocity = 0.0
    var radius = 160.0
    var damping  = 0.97
    
    init() {
        let texture = SKTexture(imageNamed: "kuma")
        texture.filteringMode = .nearest
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        name = "mascot"
        position = CGPoint(x: 0, y: -160 + 120)
        setScale(1.0)
        zPosition = 3
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spin() {
        velocity = 0.12
    }
    
    func update() {
        let gravity = 0.02
        acceleration = -1 * gravity * sin(angle)
        velocity += acceleration
        angle += velocity
        velocity *= damping
        zRotation = angle
        
        position = CGPoint(x: radius * sin(angle), y: -radius * cos(angle) + 120)
    }
}
