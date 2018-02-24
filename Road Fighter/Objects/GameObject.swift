// File Name: GameObject.swift
// Project Name: Road Fighter
// Advanced iOS Development - Assignment 2
// Developed By: Yashkumar Sompura (300967186)
//               Kshitij Suthar (300971837)
//               Shivam Shah (300877523)
//               Harsh Mehta (300951815)
// Github Link: https://github.com/Yash007/RoadFighter

import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode, GameProtocol{
    
    //Instance Variables
    var dx : CGFloat?
    var dy : CGFloat?
    
    var width: CGFloat?
    var height: CGFloat?
    
    var scale: CGFloat?
    var isColliding: Bool?
    
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    //Constructors
    init(imageString: String, initialScale: CGFloat)    {
        //Initialize the object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        
        super.init(texture: texture, color: color, size: texture.size())
        
        self.scale = initialScale
        self.setScale(scale!)
        self.width = texture.size().width * self.scale!
        self.height = texture.size().height * self.scale!
        
        self.halfWidth = self.width! * 0.5
        self.halfHeight = self.height! * 0.5
        self.isColliding = false
        self.name = imageString
        
        randomSource = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Reset() {
        
    }
    
    func CheckBounds() {
        
    }
    
    func Start() {
        
    }
    
    func Update() {
        
    }
}
