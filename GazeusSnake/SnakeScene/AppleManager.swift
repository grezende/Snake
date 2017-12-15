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
        
        self.apple = Apple(color: SKColor.red, size: CGSize(width: scene.size.width / 40,
                                                            height: scene.size.height / 20))
        print("Tamanho da maça: \(apple?.size.height)")
        generateRandomPosition(scene: scene)
        
        apple?.position = CGPoint(x: self.randomPositionX, y: self.randomPositionY)
        
        scene.addChild(self.apple!)
        
    }
    
    private func generateRandomPosition(scene: GameScene){
        
        randomPositionX = (CGFloat(arc4random_uniform(18)) + 2) * scene.size.width / 40
        print("Posicao x da maça: \(randomPositionX)")
        randomPositionY = (CGFloat(arc4random_uniform(16)) + 2) * scene.size.height / 20
        print("Posicao y da maça: \(randomPositionY)")
        
        randomPositionX += (self.apple?.size.width)! / 2
        randomPositionY += (self.apple?.size.height)! / 2
    }
    
    func resetApple(scene: GameScene){
        
        apple?.removeFromParent()
        self.setApple(scene: scene)
    }
}
