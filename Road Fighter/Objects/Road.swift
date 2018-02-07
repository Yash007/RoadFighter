//
//  Road.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-07.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit

class Road: GameObject {
    init()  {
        //initialize the object with an Image
        super.init(imageString: "final-road", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 0
        self.anchorPoint = CGPoint.zero
        self.dy = 12.0
    }
    
    override func Reset()    {
        self.position = CGPoint.zero
        
    }
    
    override func CheckBounds() {
        if self.position.y < -671.5   {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}
