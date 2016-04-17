//
//  GameScene.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright (c) 2016 Fourteen66. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var questions = Questions()
    let redCard = Card(imageNamed: "redCard.png")
    let blueCard = Card(imageNamed: "blueCard.png")
    var blueLabel : SKMultilineLabel!
    var redLabel : SKMultilineLabel!
    
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "or"
//        myLabel.fontSize = 65
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
//
//        self.addChild(myLabel)

        //Register Swipe Events
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight(_:)))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft(_:)))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        
        blueLabel = SKMultilineLabel(text: "", labelWidth: 280, pos: CGPoint(x: 0, y: +150 ),leading: 60, fontSize:50)
        
       redLabel = SKMultilineLabel(text: "", labelWidth: 280, pos: CGPoint(x: 0, y: +150 ),leading: 60, fontSize:50)
       
        
        //place cards on screen
        redCard.position = CGPointMake(400,600)
        addChild(redCard)
        redLabel.zPosition = 1
        redCard.addChild(redLabel)
            
        blueCard.position = CGPointMake(1500,600)
        addChild(blueCard)
        blueLabel.zPosition = 1
        blueCard.addChild(blueLabel)
       
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        /* Called when a touch begins */
//        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
//    }


    func updateLabels(){
        let myQuestions = questions.getSet3()
        blueLabel.text = myQuestions[0]
        redLabel.text = myQuestions[1]
    }
    
    // MARK: - Gestures
    func swipedRight(sender:UISwipeGestureRecognizer){
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        blueCard.runAction(SKAction.repeatAction(action, count: 4))
        updateLabels()
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        updateLabels()
    }

    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
}
