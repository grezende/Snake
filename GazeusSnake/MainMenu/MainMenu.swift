//
//  MainMenu.swift
//  GazeusSnake
//
//  Created by Gabriel Rezende on 16/12/17.
//  Copyright © 2017 Gabriel Rezende. All rights reserved.
//

import UIKit
import SpriteKit

class MainMenu: UIViewController {

    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        easyButton.addTarget(self, action: #selector(difficultySelected(sender:)), for: .touchUpInside)
        easyButton.tag = 0
        
        mediumButton.addTarget(self, action: #selector(difficultySelected(sender:)), for: .touchUpInside)
        mediumButton.tag = 1
        
        hardButton.addTarget(self, action: #selector(difficultySelected(sender:)), for: .touchUpInside)
        hardButton.tag = 2
    }
    
    @objc func difficultySelected(sender: UIButton){
        
        let gameVC: GameViewController
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        gameVC = storyboard.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        gameVC.difficulty = sender.tag
        
        present(gameVC, animated: true, completion: nil)
    }
}
