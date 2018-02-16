//
//  PoliceReverse.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-16.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit

class PoliceReverse: GameObject {
    var soundLock: Bool = false
    init()  {
        //initialize the object with an Image
        super.init(imageString: "police-reverse", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 3
        self.Reset()
        self.dy = 7
    }
    
    override func Reset()    {
        self.position.y = 1500 + self.height!
        let startFrom: CGFloat = CGFloat(self.halfWidth! + 20.0)
        let toFrom: CGFloat = CGFloat((screenWidth! * 0.5) - self.halfWidth! - 10.0)
        let randomX: UInt32 = arc4random_uniform(UInt32(toFrom - startFrom)) + UInt32(startFrom)
        self.position.x = CGFloat(randomX)
        soundLock = false
    }
    
    override func CheckBounds() {
        if (self.position.y < (0 - self.halfHeight!))    {
            self.Reset()
        }
        if(self.position.y > 0 && self.position.y < (667 + self.height!))   {
            if(soundLock == false)  {
                soundLock = true
                scene?.run(SKAction.playSoundFileNamed("police_siren", waitForCompletion: false))
            }
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}
