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
var livesLabel: Label?
var scoreLabel: Label?

class GameScene: SKScene {
    
    //Game Variables
    var roadSprite : Road?
    var carSprite: Car?
    var ambulanceSprite: Ambulance?
    var policeSprite: Police?
    var taxiSprite: Taxi?
    var viperSprite: Viper?
    var minitruckSprite: MiniTruck?
    var truckSprite: Truck?
    var sedanSprite: Sedan?
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
        
        
        //add Taxi
        self.taxiSprite = Taxi()
        self.addChild(taxiSprite!)
        
        
        //add Viper
        self.viperSprite = Viper()
        self.addChild(viperSprite!)
        
        
        //add Mini Truck
        self.minitruckSprite = MiniTruck()
        self.addChild(minitruckSprite!)
        
        
        //add Truck
        self.truckSprite = Truck()
        self.addChild(truckSprite!)
        
        //add Sedan
        self.sedanSprite = Sedan()
        self.addChild(sedanSprite!)
        
        // add lives label
        livesLabel = Label(labelString: "Lives: 3", position: CGPoint(x: 20.0, y: frame.height - 20.0), fontSize: 35.0, fontName: "ArcadeClassic", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(livesLabel!)
        
        // add score label
        scoreLabel = Label(labelString: "Score: 99999", position: CGPoint(x: frame.width * 0.45, y: frame.height - 20.0), fontSize: 35.0, fontName: "ArcadeClassic", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(scoreLabel!)
        
        // play background engine sound
        let engineSound = SKAudioNode(fileNamed: "CarSound")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        
        //preload sounds
        do {
            let sounds:[String] = ["ambulance_siren","Explosion","Collision","Points"]
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
        self.taxiSprite?.Update()
        self.viperSprite?.Update()
        self.minitruckSprite?.Update()
        self.truckSprite?.Update()
        Collisionmanager.CheckCollison(scene: self, object1: carSprite!, object2: policeSprite!)
        Collisionmanager.CheckCollison(scene: self, object1: carSprite!, object2: truckSprite!)
        Collisionmanager.CheckCollison(scene: self, object1: carSprite!, object2: minitruckSprite!)
        Collisionmanager.CheckCollison(scene: self, object1: carSprite!, object2: taxiSprite!)
        Collisionmanager.CheckCollison(scene: self, object1: carSprite!, object2: viperSprite!)
        Collisionmanager.CheckCollison(scene: self, object1: carSprite!, object2: ambulanceSprite!)
        
        
        if(ScoreManager.Lives > 0) {
            livesLabel?.text = "Lives: \(ScoreManager.Lives)"
            scoreLabel?.text = "Score: \(ScoreManager.Score)"
        }
        else {
            if let view = self.view {
                if let scene = SKScene(fileNamed: "GameOverScene") {
                    scene.scaleMode = .aspectFit
                    view.presentScene(scene)
                }
            }
        }
        
    }
}

