//
//  Pin.swift
//  Mascot
//
//  Created by Giovanni Gravili on 20/07/23.
//

import SpriteKit

class Pin : SKSpriteNode {
    init() {
        let texture = SKTexture(imageNamed: "pin")
        texture.filteringMode = .nearest
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        name = "pin"
        
        position = CGPoint(x: -20, y: 0 + 120)
        setScale(1.0)
        zPosition = 3
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
