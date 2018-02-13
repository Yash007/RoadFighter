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
    var carSprite: Car?
    var ambulanceReverseSprite: AmbulanceReverse?
    var ambulanceSprite: Ambulance?
    
    
    
    override func didMove(to view: SKView) {
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //add Ocean
        self.roadSprite = Road()
        self.addChild(roadSprite!)
        
        //add Car
        self.carSprite = Car()
        self.carSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 100)
        self.addChild(carSprite!)
        
        //add Ambulance Reverse
        self.ambulanceReverseSprite = AmbulanceReverse()
        self.addChild(ambulanceReverseSprite!)
        
        //add Ambulance
        self.ambulanceSprite = Ambulance()
        self.addChild(ambulanceSprite!)
        
        //preload sounds
        do {
            let sounds:[String] = ["ambulance_siren"]
            for sound in sounds {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch   {
            
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50))
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        self.roadSprite?.Update()
        self.carSprite?.Update()
        self.ambulanceReverseSprite?.Update()
        self.ambulanceSprite?.Update()
    }
}
