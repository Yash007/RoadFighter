//
//  Ambulance.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-09.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit

class AmbulanceReverse: GameObject {
    init()  {
        //initialize the object with an Image
        super.init(imageString: "ambulance-reverse", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 2
        self.Reset()
        self.dy = 15.0
    }
    
    override func Reset()    {
        self.position.y = 10000 + self.height!
        let randomX: Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfWidth!)
        self.position.x = CGFloat(randomX)
        
        
    }
    
    override func CheckBounds() {
        if (self.position.y < (0 - self.height!))    {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}
