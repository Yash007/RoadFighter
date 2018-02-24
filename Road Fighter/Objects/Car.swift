// File Name: Plane.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import SpriteKit

class Car: GameObject {
    
    //Initializers
    init()  {
        super.init(imageString: "audi", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
        //right boundry Updated
        if self.position.x > screenWidth! - self.halfWidth! - 20  {
            self.position.x = screenWidth! - self.halfWidth! - 20
        }
        //left boundry
        if self.position.x < self.halfWidth! + 20   {
            self.position.x = self.halfWidth! + 20
        }
    }
    
    override func Start() {
        self.zPosition = 1
    }
    
    override func Update() {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint) {
        self.position = newPos
    }
}

