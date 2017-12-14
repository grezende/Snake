//
//  GameScene.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let backgroundManager = BackgroundManager()
    let snake = Snake()
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
       
        backgroundManager.setBackgroundImage(scene: self.scene as! GameScene)
        
        backgroundManager.setBorders(scene: self.scene as! GameScene)
        
        snake.setSnake(scene: self.scene as! GameScene)
        
        self.startSnakeMovement()
        
        self.setUpSwipeDetectors()
    }
    
    func setUpSwipeDetectors(){
        
       let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDetected(sender:)))
        swipeRightRecognizer.direction = .right
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDetected(sender:)))
        swipeLeftRecognizer.direction = .left
        
        let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDetected(sender:)))
        swipeUpRecognizer.direction = .up
        
        let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDetected(sender:)))
        swipeDownRecognizer.direction = .down
            
        self.view?.addGestureRecognizer(swipeRightRecognizer)
        self.view?.addGestureRecognizer(swipeLeftRecognizer)
        self.view?.addGestureRecognizer(swipeUpRecognizer)
        self.view?.addGestureRecognizer(swipeDownRecognizer)
    }
    
    @objc func swipeDetected(sender: UISwipeGestureRecognizer){
        
        switch sender.direction {
            
        case .right:
            if(self.snake.currentDirection != .left){
                
                snake.currentDirection = .right
            }
            
        case .left:
            if(self.snake.currentDirection != .right){
                
                snake.currentDirection = .left
            }
            
        case .up:
            if(self.snake.currentDirection != .down){
                
                snake.currentDirection = .up
            }
        case .down:
            if(self.snake.currentDirection != .up){
                
                snake.currentDirection = .down
            }
            
        default:
            break
        }
    }
    
    func startSnakeMovement(){
        
        let singleMovement = SKAction.run {
            
            self.snake.moveSnake()
        }
        
        let waitTimeBeetweenMovements = SKAction.wait(forDuration: 0.6)
        
        let moveSequence = SKAction.sequence([singleMovement, waitTimeBeetweenMovements])
        
        self.run(SKAction.repeatForever(moveSequence))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        print("Objeto colidido 1: \(contact.bodyA.categoryBitMask)")
        print("Objeto colidido 2: \(contact.bodyB.categoryBitMask)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
