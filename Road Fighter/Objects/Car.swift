//
//  Plane.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-09.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

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
        if self.position.x > screenSize.width - self.halfWidth! - 20  {
            self.position.x = screenSize.width - self.halfWidth! - 20
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
