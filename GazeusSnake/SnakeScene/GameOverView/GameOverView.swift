//
//  GameOverView.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 14/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import UIKit

class GameOverView: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var scene: GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Pontuação: \(scene!.score)"
        
        menuButton.addTarget(self, action: #selector(menuButtonClicked(sender:)), for: .touchUpInside)
        
        retryButton.addTarget(self, action: #selector(retryButtonClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func menuButtonClicked(sender: UIButton){
        
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
        self.scene?.returnToMenu()
    }
    
    @objc func retryButtonClicked(sender: UIButton){
        
        self.scene?.reloadGame()
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
    }
}
