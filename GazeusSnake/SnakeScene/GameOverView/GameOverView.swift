//
//  GameOverView.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 14/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import UIKit

class GameOverView: UIViewController {

    @IBOutlet weak var retryButton: UIButton!
    var scene: GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        retryButton.addTarget(self, action: #selector(retryButtonClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func retryButtonClicked(sender: UIButton){
        
        scene?.snake.destroySnake(scene: scene!)
        scene?.snake.setSnake(scene: scene!)
        scene?.score = 0
        scene?.backgroundManager.updateScoreLabel(score: (scene?.score)!)
        scene?.isPaused = false
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
    }
}
