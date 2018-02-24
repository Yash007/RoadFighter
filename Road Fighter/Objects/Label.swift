// File Name: Label.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import SpriteKit
import CoreGraphics

class Label: SKLabelNode {
    
    // Constructors
    init(labelString:String,
         position:CGPoint,
         fontSize:CGFloat,
         fontName:String,
         fontColor: SKColor,
         isCentered:Bool) {
            super.init()
        
            self.text = labelString
        
            self.fontSize = fontSize
            self.fontName = fontName
            self.fontColor = fontColor
        
            if(isCentered) {
                self.position = position
            }
            else {
                self.position.x = position.x + self.frame.width * 0.5
                self.position.y = position.y - self.frame.height * 0.5
            }
            self.zPosition = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


