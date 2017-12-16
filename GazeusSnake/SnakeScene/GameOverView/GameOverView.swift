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
        
        self.scene?.reloadGame()
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
    }
}
