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
    var segments: [SnakeSegment] = []
    let initialNumberOfSegments = 3
    var segmentSize: CGSize?
    
    func setSnake(scene: GameScene){
        
        self.segmentSize = CGSize(width: scene.size.width / 40,
                                  height: scene.size.height / 20
        )
        
        self.head = SnakeHead(color: SKColor.green,
                              size: self.segmentSize!)
        
        self.head?.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        
        for i in 1...initialNumberOfSegments{
            
            let newSegment = SnakeSegment(color: SKColor.green, size: self.segmentSize!)
            newSegment.position = CGPoint(
                x: (self.head?.position.x)! - CGFloat(i) * (segmentSize?.width)!,
                y: (self.head?.position.y)!)
            self.segments.append(newSegment)
        }
        
        for s in self.segments{
            scene.addChild(s)
        }
        
        scene.addChild(head!)
    }
}
