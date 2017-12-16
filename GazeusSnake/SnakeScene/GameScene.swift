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
    
    weak var gameViewController: GameViewController? = nil
    
    let backgroundManager = BackgroundManager()
    let appleManager = AppleManager()
    var snake = Snake()
    var score = 0
    var difficulty: Int = 1
    var spaceSize = CGSize(width: 0, height: 0)
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.spaceSize = CGSize(width: self.size.width / 40,
                                height: self.size.height / 20)
       
        backgroundManager.setBackgroundImage(scene: self.scene as! GameScene)
        
        backgroundManager.setBorders(scene: self.scene as! GameScene)
        
        backgroundManager.setScoreLabel(scene: self)
        
        snake.setSnake(scene: self.scene as! GameScene)
        
        self.startSnakeMovement()
        
        self.setUpSwipeDetectors()
        
        appleManager.setApple(scene: self, snake: self.snake)
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
            
            if(self.checkCollisionWithBorder()){
                
                self.gameOver()
            }
            else{
                
                self.snake.moveSnake()
            }
        }
        
        let waitTimeBeetweenMovements: SKAction
        
        switch self.difficulty {
            
        case 0:
            waitTimeBeetweenMovements = SKAction.wait(forDuration: 0.3)
            
        case 1:
            waitTimeBeetweenMovements = SKAction.wait(forDuration: 0.1)
       
        case 2:
            waitTimeBeetweenMovements = SKAction.wait(forDuration: 0.07)
            
        default:
            waitTimeBeetweenMovements = SKAction.wait(forDuration: 0.1)
        }
        
        let moveSequence = SKAction.sequence([singleMovement, waitTimeBeetweenMovements])
        
        self.run(SKAction.repeatForever(moveSequence))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if(contact.bodyA.categoryBitMask == collisionValue.apple.rawValue ||
            contact.bodyB.categoryBitMask == collisionValue.apple.rawValue){
            
            self.score += 1
            backgroundManager.updateScoreLabel(score: self.score)
            appleManager.resetApple(scene: self)
            self.snake.addSegment(scene: self)
        }
        
        else{
            
            self.gameOver()
        }
    }
    
    func checkCollisionWithBorder() -> Bool{
        
        switch self.snake.currentDirection{
            
        case .up:
            if((self.snake.head?.position.y)! + self.spaceSize.height >= (backgroundManager.topBorder?.position.y)!){
                
                return true
            }
            
        case .down:
            if((self.snake.head?.position.y)! - self.spaceSize.height <= (backgroundManager.bottomBorder?.position.y)!){
                
                return true
            }
            
        case .right:
            if((self.snake.head?.position.x)! + self.spaceSize.width >= (backgroundManager.rightBorder?.position.x)!){
                
                return true
            }
            
        case .left:
            if((self.snake.head?.position.x)! - self.spaceSize.width <= (backgroundManager.leftBorder?.position.x)!){
                
                return true
            }
        }
        
        return false
    }
    
    func gameOver(){
        
        scene?.isPaused = true
        
        let gameOverViewController = GameOverView()
        gameOverViewController.scene = self.scene as? GameScene
        
        self.gameViewController?.addChildViewController(gameOverViewController)
        self.gameViewController?.view.addSubview(gameOverViewController.view)
    }
    
    func reloadGame(){
        
        self.snake.destroySnake(scene: self)
        self.snake.setSnake(scene: self)
        self.score = 0
        self.backgroundManager.updateScoreLabel(score: self.score)
        self.isPaused = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
