//
//  Card.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright © 2016 Fourteen66. All rights reserved.
//

import Foundation
import SpriteKit


class Card : SKSpriteNode {
    
    required init(coder aDecoder: NSCoder!) {
        fatalError("NSCoding not supported")
    }
    
    init(imageNamed: String) {
        let cardTexture = SKTexture(imageNamed: imageNamed)
        super.init(texture: cardTexture, color: UIColor.brownColor(), size: cardTexture.size())
    }
}