//
//  Police.swift
//  Road Fighter
//
//  Created by YASH SOMPURA on 2018-02-15.
//  Copyright © 2018 YASH SOMPURA. All rights reserved.
//

import SpriteKit
import GameplayKit

class Police: GameObject {
    
    init()  {
        //initialize the object with an Image
        super.init(imageString: "Police", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 3
        self.Reset()
        self.dy = 2
    }
    
    override func Reset()    {
        self.isHidden = false
        
        self.position.y = 1000 + self.height!
        let startFrom: CGFloat = CGFloat(self.halfWidth! + 20.0)
        let toFrom: CGFloat = CGFloat(screenWidth! - self.halfWidth! - 20.0)
        let randomX: UInt32 = arc4random_uniform(UInt32(toFrom - startFrom)) + UInt32(startFrom)
        self.position.x = CGFloat(randomX)
        
    }
    
    override func CheckBounds() {
        if (self.position.y < (0 - self.halfHeight!))    {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
}
