//
//  Card.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright © 2016 Fourteen66. All rights reserved.
//

import Foundation
import SpriteKit
/**
 Card object
 */
class Card : SKSpriteNode {
    var label : SKMultilineLabel
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(imageNamed: String) {
        let cardTexture = SKTexture(imageNamed: imageNamed)
        //initialize label
        label = SKMultilineLabel(text: "That", labelWidth: 100, pos: CGPoint(x: 0, y: 0 ),leading: 60, fontSize:20)
//        (texture: cardTexture, color: UIColor.brown(),size: x)
        super.init(texture: cardTexture,color: UIColor.brown(), size: CGSize(width: 500, height:400))

        
     
    }
}
