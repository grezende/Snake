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
    let initialNumberOfSegments = 3
    var segmentSize: CGSize?
    var currentDirection = directions.right
    
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
    
    func moveSnake(){
        
        var lastPosition: CGPoint
        
        switch self.currentDirection {
            
        case directions.right:
            
            lastPosition = (self.head?.position)!
            head?.position.x += (segmentSize?.width)!
            
            for s in self.segments{
                
                let tempLastPosition = s.position
                s.position = lastPosition
                lastPosition = tempLastPosition
            }
            
        case directions.up:
            
            lastPosition = (self.head?.position)!
            head?.position.y += (segmentSize?.height)!
            
            for s in self.segments{
                
                let tempLastPosition = s.position
                s.position = lastPosition
                lastPosition = tempLastPosition
            }
            
        default:
            break
        }
    }
}
