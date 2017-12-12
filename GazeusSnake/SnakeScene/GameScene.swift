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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
       
        
    }
}
