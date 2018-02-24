// File Name: Collisionmanager.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import CoreGraphics
import SpriteKit

class Collisionmanager: SKScene, SKPhysicsContactDelegate {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public static func CheckCollison(scene: SKScene, object1: GameObject, object2: GameObject) {
        if (CGPoint.Distance(P1: object1.position, P2: object2.position) < object1.halfHeight! + 30 + object2.halfWidth! - 35) {
            if(!object2.isColliding!) {
                if(object2.name == "Police") {
                    let animateMove = SKAction.moveTo(x: object1.position.x, duration: 0.1)
                    object1.run(animateMove)
                    let particle = SKEmitterNode(fileNamed: "Explosion.sks")!
                    particle.position.x = 0;
                    //particle.particlePosition.x = object2.position.x
                    object1.addChild(particle)
                    object2.isHidden = true
                    ScoreManager.Score += 100
                    scene.run(SKAction.playSoundFileNamed("Explosion", waitForCompletion: true))
                    scene.run(SKAction.playSoundFileNamed("Points", waitForCompletion: false))
                }
                
                if(object2.name == "viper" || object2.name == "truck" || object2.name == "car" || object2.name == "mini_van" || object2.name == "mini-truck" || object2.name == "taxi") {
                    
                    var setpos: CGFloat = 0
                    var newpos: CGFloat = 0
                    var setpos2: CGFloat = 0
                    var newpos2: CGFloat = 0
                    if object1.position.x >= object2.position.x {
                        newpos = object2.halfWidth! + 5
                        newpos2 = 20
                        setpos = object1.position.x + newpos
                        setpos2 = object2.position.x - newpos2
                    }
                    else{
                        newpos = object2.halfWidth! + 5
                        newpos2 = 20
                        setpos = object1.position.x - newpos
                        setpos2 = object2.position.x + newpos2
                    }
                    let animateMove = SKAction.moveTo(x:setpos, duration: 0.1)
                    let animateMove2 = SKAction.moveTo(x: setpos2, duration: 0.1)
                    object1.run(animateMove)
                    object2.run(animateMove2)
                    ScoreManager.Lives -= 1
                    scene.run(SKAction.playSoundFileNamed("Collision", waitForCompletion: false))
                }
                
                if(object2.name == "ambulance") {
                    ScoreManager.Lives = 0
                }
                
                object2.isColliding = true
            }
        }
        else {
            object2.isColliding = false
        }
    }
}


