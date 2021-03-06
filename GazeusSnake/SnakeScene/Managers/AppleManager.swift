//
//  AppleManager.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 14/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import SpriteKit

class AppleManager{
    
    var apple: Apple?
    
    var randomPositionX: CGFloat = 0
    var randomPositionY: CGFloat = 0
    
    func setApple(scene: GameScene){
        
        let appleSize = scene.spaceSize
        
        self.apple = Apple(color: SKColor.red, size: appleSize)
        
        generateRandomPosition(scene: scene)
        
        scene.addChild(self.apple!)
    }
    
    private func generateRandomPosition(scene: GameScene){
        
        randomPositionX = (CGFloat(arc4random_uniform(36)) + 2) * scene.size.width / 40
        randomPositionY = (CGFloat(arc4random_uniform(16)) + 2) * scene.size.height / 20
        
        randomPositionX += (self.apple?.size.width)! / 2
        randomPositionY += (self.apple?.size.height)! / 2
        
        self.apple?.position = CGPoint(x: self.randomPositionX, y: self.randomPositionY)
    }
    
    func resetApple(scene: GameScene){
        
        apple?.removeFromParent()
        self.setApple(scene: scene)
    }
}
