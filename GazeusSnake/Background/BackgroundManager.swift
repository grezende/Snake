//
//  BackgroundManager.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 12/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class BackgroundManager: SKSpriteNode{
    
    let background = SKSpriteNode(imageNamed: "background")
    var topBorder: SKSpriteNode?
    var leftBorder: SKSpriteNode?
    var rightBorder: SKSpriteNode?
    var bottomBorder: SKSpriteNode?
    
    func setBackgroundImage(scene: GameScene){
    
        background.size.width = (scene.size.width)
        background.size.height = (scene.size.height)
        background.position = CGPoint(x: (scene.size.width) / 2,
                                      y: (scene.size.height) / 2)
        background.zPosition = -3
        
        scene.addChild(background)
    }
    
    func setBorders(scene: GameScene){
        
        let sceneSize = scene.size
        
        self.topBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
            width: UIScreen.main.bounds.width / 40 * 38, height: 3.0
        ))
        
        topBorder?.position = CGPoint(
            x: sceneSize.width / 40 + (topBorder?.size.width)! / 2,
            y: sceneSize.height - sceneSize.height / 20
        )
        
        topBorder?.physicsBody = SKPhysicsBody(rectangleOf: (topBorder?.size)!)
        topBorder?.physicsBody?.isDynamic = false
        //        ceiling.physicsBody?.categoryBitMask = PhysicsCategory.Floor
        
        self.bottomBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
            width: UIScreen.main.bounds.width / 40 * 38, height: 3.0))
        
        bottomBorder?.position = CGPoint(
            x: sceneSize.width / 40 + (bottomBorder?.size.width)! / 2,
            y: sceneSize.height / 20
        )
        
        bottomBorder?.physicsBody = SKPhysicsBody(rectangleOf: (topBorder?.size)!)
        bottomBorder?.physicsBody?.isDynamic = false
        //        ceiling.physicsBody?.categoryBitMask = PhysicsCategory.Floor
        
        self.leftBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
            width: 3.0, height: UIScreen.main.bounds.height / 20 * 18))
        
        leftBorder?.position = CGPoint(
            x: sceneSize.width / 40 + (leftBorder?.size.width)! / 2,
            y: sceneSize.height / 20 + (leftBorder?.size.height)! / 2
        )
        
        leftBorder?.physicsBody = SKPhysicsBody(rectangleOf: (leftBorder?.size)!)
        leftBorder?.physicsBody?.isDynamic = false
        //        ceiling.physicsBody?.categoryBitMask = PhysicsCategory.Floor
        
        self.rightBorder = SKSpriteNode(color: UIColor.white, size: CGSize(
            width: 3.0, height: UIScreen.main.bounds.height / 20 * 18))
        
        rightBorder?.position = CGPoint(
            x: sceneSize.width / 40 * 39 + (rightBorder?.size.width)! / 2,
            y: sceneSize.height / 20 + (rightBorder?.size.height)! / 2
        )
        
        rightBorder?.physicsBody = SKPhysicsBody(rectangleOf: (rightBorder?.size)!)
        rightBorder?.physicsBody?.isDynamic = false
        //        ceiling.physicsBody?.categoryBitMask = PhysicsCategory.Floor
        
        scene.addChild(rightBorder!)
        scene.addChild(leftBorder!)
        scene.addChild(bottomBorder!)
        scene.addChild(topBorder!)
    }
}
