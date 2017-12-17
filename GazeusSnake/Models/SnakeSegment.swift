//
//  SnakeSegment.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class SnakeSegment: SKSpriteNode{
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        
        super.init(texture: texture, color: color, size: size)
        
        let hitbox = CGSize(width: 3 * self.size.width / 4,
                            height: 3 * self.size.height / 4)
        
        self.zPosition = layer.objects.rawValue
        self.physicsBody = SKPhysicsBody(rectangleOf: hitbox)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = collisionValue.snakeSegment.rawValue
        self.physicsBody?.collisionBitMask = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
