//
//  Snake.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class Snake{
    
    var head: SnakeHead?
    var segments: SnakeSegment?
    let initialNumberOfSegments = 3
    
    func setSnake(scene: GameScene){
        
        self.head = SnakeHead(color: SKColor.green,
                              size: CGSize(width: scene.size.width / 40,
                                           height: scene.size.height / 20))
        
        self.head?.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        
        scene.addChild(head!)
    }
}
