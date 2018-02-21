//
//  GameStartScene.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-21.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation
import CoreMotion

class GameStartScene: SKScene   {
    var roadSprite: Road?
    
    override func didMove(to view: SKView) {
        self.roadSprite = Road()
        self.addChild(roadSprite!)
    }
    
}
