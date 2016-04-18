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
    var label : SKMultilineLabel
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(imageNamed: String) {
        let cardTexture = SKTexture(imageNamed: imageNamed)
        //initialize label
        label = SKMultilineLabel(text: "That", labelWidth: 280, pos: CGPoint(x: 0, y: +200 ),leading: 60, fontSize:40)
        super.init(texture: cardTexture, color: UIColor.brownColor(), size: cardTexture.size())
        
        //set label on card
        label.zPosition = 1
        self.addChild(label)
    }
}