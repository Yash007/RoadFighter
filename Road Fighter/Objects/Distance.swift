// File Name: Distance.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import CoreGraphics
import SpriteKit

public extension CGPoint {
    
    public static func Distance(P1: CGPoint, P2: CGPoint) -> CGFloat {
        return sqrt(pow((P2.x - P1.x), 2) + pow((P2.y - P1.y), 2))
    }
    
}
