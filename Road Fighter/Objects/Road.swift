// File Name: Road.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import SpriteKit

class Road: GameObject {
    init()  {
        //initialize the object with an Image
        super.init(imageString: "final-road-1", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 0
        self.anchorPoint = CGPoint.zero
        self.dy = 20.0
    }
    
    override func Reset()    {
        self.position = CGPoint.zero
        
    }
    
    override func CheckBounds() {
        if self.position.y < -670   {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}

