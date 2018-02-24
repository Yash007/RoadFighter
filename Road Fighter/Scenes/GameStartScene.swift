// File Name: GameStartScene.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation
import CoreMotion

class GameStartScene: SKScene {
    
    let startButton = SKSpriteNode(imageNamed: "Start")
    let tutorialButton = SKSpriteNode(imageNamed: "Tutorial")
    
    override func didMove(to view: SKView) {
        startButton.position = CGPoint(x: size.width*0.5, y: size.height*0.3)
        startButton.name = "Start"
        startButton.zPosition = 3
        startButton.size = CGSize(width: startButton.size.width*1, height: startButton.size.height*1)
        self.addChild(startButton)
        
        tutorialButton.position = CGPoint(x: size.width*0.5, y: size.height*0.2)
        tutorialButton.name = "Tutorial"
        tutorialButton.zPosition = 3
        tutorialButton.size = CGSize(width: startButton.size.width*1.2, height: startButton.size.height*1)
        self.addChild(tutorialButton)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == startButton{
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
            }
            
            if node == tutorialButton{
                if let view = self.view {
                    if let scene = SKScene(fileNamed: "GameTutorial") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
            }
        }
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
        
    }
}


