//
//  Snake.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

enum directions{
    
    case up
    case down
    case right
    case left
}

class Snake{
    
    var head: SnakeHead?
    var segments: [SnakeSegment] = []
    let initialNumberOfSegments = 4
    var segmentSize: CGSize?
    var currentDirection = directions.right
    var lastSegmentPosition = CGPoint(x: 0, y: 0)
    
    func setSnake(scene: GameScene){
        
        self.segmentSize = CGSize(width: scene.size.width / 40,
                                  height: scene.size.height / 20
        )
        
        self.head = SnakeHead(color: SKColor.green, size: self.segmentSize!)
        
        self.head?.position = CGPoint(
            x: scene.size.width / 2 + (self.head?.size.width)! / 2,
            y: scene.size.height / 2 + (self.head?.size.height)! / 2
        )
        
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
        
        self.currentDirection = .right
    }
    
    func moveSnake(){
        
        self.lastSegmentPosition = (self.head?.position)!
        
        switch self.currentDirection {
            
        case directions.right:
            
            head?.zRotation = 0
            head?.position.x += (segmentSize?.width)!
            
        case directions.left:
            
            head?.yScale *= -1
            head?.zRotation = CGFloat(Double.pi)
            head?.position.x -= (segmentSize?.width)!
            
        case directions.up:
            
            head?.zRotation = CGFloat(Double.pi) / 2
            head?.position.y += (segmentSize?.height)!
            
        case directions.down:

            head?.zRotation = 3 * CGFloat(Double.pi) / 2
            head?.position.y -= (segmentSize?.height)!
        }
        
        for s in self.segments{
            
            let tempLastPosition = s.position
            s.position = self.lastSegmentPosition
            self.lastSegmentPosition = tempLastPosition
        }
    }
    
    func destroySnake(scene: GameScene){
        
        self.head?.removeFromParent()
        
        for s in self.segments{
            
            s.removeFromParent()
        }
        
        self.segments = []
    }
    
    func addSegment(scene: GameScene){
        
        let newSegment = SnakeSegment(color: SKColor.green, size: self.segmentSize!)
        
        newSegment.position = CGPoint(
            x: self.lastSegmentPosition.x, y: self.lastSegmentPosition.y)
        self.segments.append(newSegment)
        
        scene.addChild(newSegment)
    }
}
