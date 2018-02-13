//
//  Ambulance.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-09.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

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
        self.position.y = 1000 + self.height!
        let startFrom1: CGFloat = CGFloat(self.halfWidth! + 10.0)
        let toFrom1: CGFloat = CGFloat((screenWidth! * 0.5) - self.halfWidth! - 20.0)
        let randomX1: UInt32 = arc4random_uniform(UInt32(toFrom1)) + UInt32(startFrom1)
        self.position.x = CGFloat(randomX1)
    }
    
    override func CheckBounds() {
        if (self.position.y < (0 - self.halfWidth!))    {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}
