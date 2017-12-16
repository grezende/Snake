//
//  BackgroundManager.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class BackgroundManager{
    
    enum borderType{
        
        case top
        case bottom
        case right
        case left
    }
    
    let background = SKSpriteNode(imageNamed: "background")
    var topBorder: SKSpriteNode?
    var leftBorder: SKSpriteNode?
    var rightBorder: SKSpriteNode?
    var bottomBorder: SKSpriteNode?
    
    var scoreLabel: SKLabelNode?
    
    func setBackgroundImage(scene: GameScene){
    
        background.size.width = (scene.size.width)
        background.size.height = (scene.size.height)
        background.position = CGPoint(x: (scene.size.width) / 2,
                                      y: (scene.size.height) / 2)
        background.zPosition = layer.background.rawValue
        
        scene.addChild(background)
    }
    
    func setBorders(scene: GameScene){
        
        self.topBorder = createBorder(type: .top, scene: scene)
        self.bottomBorder = createBorder(type: .bottom, scene: scene)
        self.leftBorder = createBorder(type: .left, scene: scene)
        self.rightBorder = createBorder(type: .right, scene: scene)
        
        scene.addChild(rightBorder!)
        scene.addChild(leftBorder!)
        scene.addChild(bottomBorder!)
        scene.addChild(topBorder!)
    }
    
    func createBorder(type: borderType, scene: GameScene) -> SKSpriteNode{
        
        var newBorder: SKSpriteNode
        let sceneSize = scene.size
        
        switch type {
            
        case .top:
            newBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
                width: UIScreen.main.bounds.width / 40 * 38, height: 3.0
            ))
            newBorder.position = CGPoint(
                x: sceneSize.width / 40 + newBorder.size.width / 2,
                y: sceneSize.height - sceneSize.height / 20 + newBorder.size.height / 2
            )
            
        case .bottom:
            newBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
                width: UIScreen.main.bounds.width / 40 * 38, height: 3.0))
            
            newBorder.position = CGPoint(
                x: sceneSize.width / 40 + newBorder.size.width / 2,
                y: sceneSize.height / 20 - newBorder.size.height / 2
            )
            
        case .left:
            newBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
                width: 3.0, height: UIScreen.main.bounds.height / 20 * 18))
            
            newBorder.position = CGPoint(
                x: sceneSize.width / 40 - newBorder.size.width / 2,
                y: sceneSize.height / 20 + newBorder.size.height / 2
            )
            
        case .right:
            newBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
                width: 3.0, height: UIScreen.main.bounds.height / 20 * 18))
            
            newBorder.position = CGPoint(
                x: sceneSize.width / 40 * 39 + newBorder.size.width / 2,
                y: sceneSize.height / 20 + newBorder.size.height / 2
            )
        }
        
        newBorder.zPosition = layer.objects.rawValue
        
        return newBorder
    }
    
    func setScoreLabel(scene: GameScene){
        
        self.scoreLabel = SKLabelNode(fontNamed: "GillSans-Light")
        self.scoreLabel?.text = "0"
        self.scoreLabel?.fontSize = 120
        self.scoreLabel?.fontColor = SKColor(white: 1, alpha: 0.4)
        self.scoreLabel?.position = CGPoint(x: scene.size.width / 2,
                                            y: scene.size.height / 2)
        self.scoreLabel?.zPosition = layer.score.rawValue
        scene.addChild(scoreLabel!)
    }
    
    func updateScoreLabel(score: Int){
        
        self.scoreLabel?.text = "\(score)"
    }
}
