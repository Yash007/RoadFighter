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
import CoreMotion

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //Game Variables
    var roadSprite : Road?
    var carSprite: Car?
    var ambulanceSprite: Ambulance?
    var policeSprite: Police?
    var policeReverseSprite: PoliceReverse?
    var taxiSprite: Taxi?
    var taxiReverseSprite: TaxiReverse?
    var viperSprite: Viper?
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        
        //add Ocean
        self.roadSprite = Road()
        self.addChild(roadSprite!)
        
        //add Car
        self.carSprite = Car()
        self.carSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 100)
        self.addChild(carSprite!)
        
        
        //add Ambulance
        self.ambulanceSprite = Ambulance()
        self.addChild(ambulanceSprite!)
        
        //add Police
        self.policeSprite = Police()
        self.addChild(policeSprite!)
        
        //add Police Reverse
        self.policeReverseSprite = PoliceReverse()
        self.addChild(policeReverseSprite!)
        
        //add Taxi
        self.taxiSprite = Taxi()
        self.addChild(taxiSprite!)
        
        //add Taxi Reverse
        self.taxiReverseSprite = TaxiReverse()
        self.addChild(taxiReverseSprite!)
        
        //add Viper Reverse
        self.viperSprite = Viper()
        self.addChild(viperSprite!)
        
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
        if (pos.x - (self.carSprite?.position.x)! >= 0 || (self.carSprite?.position.x)! - pos.x >= 0) {
            let animateMove = SKAction.moveTo(x: pos.x, duration: 0.2)
            self.carSprite?.run(animateMove)
        }
        else    {
            self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 100))
        }
        
    }
    func touchMoved(toPoint pos : CGPoint) {
        if (pos.x - (self.carSprite?.position.x)! >= 0 || (self.carSprite?.position.x)! - pos.x >= 0) {
            let animateMove = SKAction.moveTo(x: pos.x, duration: 0.1)
            self.carSprite?.run(animateMove)
        }
        else    {
            self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 100))
        }
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if (pos.x - (self.carSprite?.position.x)! >= 0 || (self.carSprite?.position.x)! - pos.x >= 0) {
            let animateMove = SKAction.moveTo(x: pos.x, duration: 0.2)
            self.carSprite?.run(animateMove)
        }
        else    {
            self.carSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 100))
        }
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
        self.ambulanceSprite?.Update()
        self.policeSprite?.Update()
        self.policeReverseSprite?.Update()
        self.taxiSprite?.Update()
        self.taxiReverseSprite?.Update()
        self.viperSprite?.Update()
    }
}

