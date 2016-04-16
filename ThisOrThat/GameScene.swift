//
//  GameScene.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright (c) 2016 Fourteen66. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "or"
        myLabel.fontSize = 65
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        
        let red = Card(imageNamed: "redCard.png")
        red.position = CGPointMake(400,600)
        addChild(red)
        
        let blue = Card(imageNamed: "blueCard.png")
        blue.position = CGPointMake(1500,600)
        addChild(blue)
        
        blue.addChild(newQuestionLabel())
        red.addChild(newQuestionLabel())
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
    
    func newQuestionLabel() -> SKLabelNode {
        let questionLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
        questionLabel.name = "questionLabel"
        questionLabel.fontSize = 20
        questionLabel.fontColor = UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
        questionLabel.text = "0"
        questionLabel.position = CGPointMake(25, 40)
        
        return questionLabel
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
