//
//  SnakeHead.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class SnakeHead: SKSpriteNode{
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        let eye = SKSpriteNode(color: SKColor.black,
                               size: CGSize(width: self.size.width / 4,
                                            height: self.size.height / 4))
        
        eye.position = CGPoint(x: self.size.width / 4 * 3 - self.size.width / 2,
                               y: self.size.height / 4 * 3 - self.size.height / 2)
        
        self.addChild(eye)
        
        let collider = SKSpriteNode(
            color: SKColor.clear,
            size: CGSize(width: self.size.width / 2, height: self.size.height / 2 )
        )
        collider.position = CGPoint(x: 0,
                                    y: self.size.height / 2 - collider.size.height)
        
        collider.physicsBody = SKPhysicsBody(rectangleOf: collider.size)
        collider.physicsBody?.isDynamic = false
        collider.physicsBody?.categoryBitMask = collisionValue.snakeHead.rawValue
        collider.physicsBody?.contactTestBitMask = collisionValue.snakeSegment.rawValue |
            collisionValue.apple.rawValue
        
        self.addChild(collider)
        
        self.zPosition = layer.objects.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
