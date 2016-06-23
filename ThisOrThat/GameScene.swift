//
//  GameScene.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright (c) 2016 Fourteen66. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    //Questions list
    var questions = Questions()
    //cards
    var redCard: SKSpriteNode!
    var blueCard: SKSpriteNode!
    //phycial locations
    let centerPoint = CGPoint(x:960, y:540)
    
    
    
    
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        
        //set self to be physics world delegate
        self.physicsWorld.contactDelegate = self
        
        //cards posistioning
        redCard = self.childNode(withName: "redCard") as! SKSpriteNode
        blueCard = self.childNode(withName: "blueCard") as! SKSpriteNode
        redCard.zPosition = 0
        blueCard.zPosition = 0
        
        // "or" label
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "or"
        myLabel.fontSize = 120
        myLabel.position = CGPoint(x:(self.frame.midX), y:self.frame.midY)
        myLabel.zPosition = 0
        self.addChild(myLabel)

        //update labels
        updateLabels()
        
        
        //Register Swipe Events
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown(_:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        


       
    }
    

    
    
    /**
     Update questions on the card
    */
    func updateLabels(){
        
        
        //initialize RED label
        let redLabel = SKMultilineLabel(text: "This", labelWidth: 100, pos: CGPoint(x: 0, y: 20 ),leading: 15, fontSize:10)
        //set red label on card
        redLabel.zPosition = 0
    
        
        //initialize BLUE label
        let blueLabel = SKMultilineLabel(text: "That", labelWidth: 100, pos: CGPoint(x: 0, y: 20 ),leading: 15, fontSize:10)
        //set blue label on card
        blueLabel.zPosition = 0
        
        
        
        //update questions
        let myQuestions = questions.getSet3()
        blueCard.removeAllChildren()
        blueCard.addChild(blueLabel)
        blueLabel.text = myQuestions[0]
        redCard.removeAllChildren()
        redCard.addChild(redLabel)
        redLabel.text = myQuestions[1]
    }
    
    // MARK: - Gestures
    /**
     process a right swipe
    */
    func swipedRight(_ sender:UISwipeGestureRecognizer){
        //check that no cards are currently centered
        if !(redCard.position == centerPoint || blueCard.position == centerPoint){
            //set blue card behind
            blueCard.zPosition = 1
            //set red card ahead
            redCard.zPosition = 2
            //move red card to center
            let moveToCenter = SKAction.move(to: CGPoint(x:960, y:540), duration: 1)
            redCard.run(moveToCenter)
            //rotate red card
            let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration: 0.5)
            redCard.run(SKAction.repeat(action, count: 2))
            
        }
        
        
        
    }
    
    /**
     process a left swipe
     */
    func swipedLeft(_ sender:UISwipeGestureRecognizer){
        //check that no cards are currently centered
        if !(redCard.position == centerPoint || blueCard.position == centerPoint){
            //move red card behind
            redCard.zPosition = 1
            //move blue card ahead
            blueCard.zPosition = 2
            //move blue card to center
            let moveToCenter = SKAction.move(to: CGPoint(x:960, y:540), duration: 1)
            blueCard.run(moveToCenter)
            //rotate blue card
            let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration: 0.5)
            blueCard.run(SKAction.repeat(action, count: 2))
        }
    }
    
    
    /**
     process a down swipe
     */
    func swipedDown(_ sender:UISwipeGestureRecognizer){
        //check that one card is centered
        if redCard.position == centerPoint || blueCard.position == centerPoint{
            //return cards to start
            let returnToRedStart = SKAction.move(to: CGPoint(x:400, y:540), duration: 1)
            redCard.run(returnToRedStart)
            
            let returnToBlueStart = SKAction.move(to: CGPoint(x:1500, y:540), duration: 1)
            blueCard.run(returnToBlueStart)
            
            
            //update labels after completing the wait action
            redCard.run(SKAction.wait(forDuration: 1), completion: {
                self.updateLabels()
                
            })
        }
        
    
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact")
    }
}
