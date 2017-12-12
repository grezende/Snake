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
    
    override func didMove(to view: SKView) {
       
        backgroundManager.setBackgroundImage(scene: self.scene as! GameScene)
        
        backgroundManager.setBorders(scene: self.scene as! GameScene)
    }
    
    func setBorders(){
        
        let sceneSize = self.scene?.size
        
        let topBorder = SKSpriteNode(color: UIColor.white, size: CGSize(width: UIScreen.main.bounds.width / 20 * 18, height: 3.0))
        
        topBorder.position = CGPoint(x: (sceneSize?.width)! / 20 + topBorder.size.width / 2,
                                   y: (sceneSize?.height)! -
                                    (sceneSize?.height)! / 20)
        
        topBorder.physicsBody = SKPhysicsBody(rectangleOf: topBorder.size)
        topBorder.physicsBody?.isDynamic = false
//        ceiling.physicsBody?.categoryBitMask = PhysicsCategory.Floor
        
        self.scene?.addChild(topBorder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
       
        
    }
}
