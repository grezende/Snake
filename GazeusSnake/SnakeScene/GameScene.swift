//
//  GameScene.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let backgroundManager = BackgroundManager()
    let snake = Snake()
    
    override func didMove(to view: SKView) {
       
        backgroundManager.setBackgroundImage(scene: self.scene as! GameScene)
        
        backgroundManager.setBorders(scene: self.scene as! GameScene)
        
        snake.setSnake(scene: self.scene as! GameScene)
        
        let singleMovement = SKAction.run {
            
            self.snake.moveSnake()
        }
        
        let waitTimeBeetweenMovements = SKAction.wait(forDuration: 0.6)
        
        let moveSequence = SKAction.sequence([singleMovement, waitTimeBeetweenMovements])
        
        self.run(SKAction.repeatForever(moveSequence))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        snake.currentDirection = directions.up
    }
    
    override func update(_ currentTime: TimeInterval) {
       
    }
}
