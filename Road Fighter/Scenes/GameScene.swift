//
//  GameScene.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-07.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //Game Variables
    var roadSprite : Road?
    
    
    override func didMove(to view: SKView) {
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //add Ocean
        self.roadSprite = Road()
        self.addChild(roadSprite!)
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        self.roadSprite?.Update()
    }
}
