//
//  Apple.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 14/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class Apple: SKSpriteNode{
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
        
        let hitbox = CGSize(width: self.size.width / 2, height: self.size.height / 2)
        
        self.zPosition = layer.objects.rawValue
        self.physicsBody = SKPhysicsBody(rectangleOf: hitbox)
        self.physicsBody?.categoryBitMask = collisionValue.apple.rawValue
        self.physicsBody?.contactTestBitMask = collisionValue.snakeSegment.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
