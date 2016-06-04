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
//    let redCard = Card(imageNamed: "redCard.png")
//    let blueCard = Card(imageNamed: "blueCard.png")
    
    
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //self.backgroundColor = UIColor.cyanColor()
        
        //set self to be physics world delegate
        self.physicsWorld.contactDelegate = self
        
        //cards posistioning
        redCard = self.childNodeWithName("redCard") as! SKSpriteNode
        blueCard = self.childNodeWithName("blueCard") as! SKSpriteNode
        
        // "or" label
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "or"
//        myLabel.fontSize = 120
//        myLabel.position = CGPoint(x:(CGRectGetMidX(self.frame)/2), y:CGRectGetMidY(self.frame))
//        myLabel.zPosition = 0
//        self.addChild(myLabel)

        //update labels
        updateLabels()
        
        
        //Register Swipe Events
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight(_:)))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft(_:)))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown(_:)))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        

        
//        //place cards on screen
//        //red card
//        redCard.position = CGPointMake(400,600)
//        redCard.zPosition = 1
//        addChild(redCard)
//        //blue card
//        blueCard.position = CGPointMake(1500,600)
//        blueCard.zPosition = 1
//        addChild(blueCard)
        
       
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

    
    
    /**
     Update questions on the card
    */
    func updateLabels(){
        
        
        //initialize RED label
        let redLabel = SKMultilineLabel(text: "This", labelWidth: 280, pos: CGPoint(x: 0, y: 0 ),leading: 60, fontSize:40)
        
        //set red label on card
        redLabel.zPosition = 1
        //redCard.addChild(redLabel)
        
        //initialize BLUE label
        let blueLabel = SKMultilineLabel(text: "That", labelWidth: 280, pos: CGPoint(x: 0, y: 0 ),leading: 60, fontSize:40)
        //        super.init(texture: cardTexture, color: UIColor.brownColor(), size: cardTexture.size())
        
        //set blue label on card
        blueLabel.zPosition = 1
        //blueCard.addChild(blueLabel)
        
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
    func swipedRight(sender:UISwipeGestureRecognizer){
//        let moveToRight = SKAction.moveToX(1000, duration: 1.0)
//        redCard.runAction(SKAction.repeatAction(moveToRight, count: 1))
        
         redCard.physicsBody?.applyImpulse(CGVector(dx: 13000, dy: 0))
        
          
        
//        let resize = SKAction.resizeByWidth(500, height: 500, duration: 1)
//        redCard.runAction(SKAction.repeatAction(resize, count: 1))
  
//        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration: 0.5)
//        blueCard.runAction(SKAction.repeatAction(action, count: 2))
        
    }
    
    /**
     process a left swipe
     */
    func swipedLeft(sender:UISwipeGestureRecognizer){
//        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:0.5)
//        redCard.runAction(SKAction.repeatAction(action, count: 2))
//        let action2 = SKAction.resizeToWidth(600, height: 900, duration: 1)
//        redCard.runAction(SKAction.repeatAction(action2, count: 1))
//        let action3 = SKAction.moveTo(CGPointMake(960, 540), duration: 1)
//        redCard.runAction(SKAction.repeatAction(action3, count: 2))
//        let action4 = SKAction.applyAngularImpulse(1.0, duration: 3)
//        redCard.runAction(SKAction.repeatAction(action4, count: 3))
        
       
        
    }
    /**
     process a down swipe
     */
    func swipedDown(sender:UISwipeGestureRecognizer){
        let moveBackRed = SKAction.moveTo(CGPointMake(456.151, 601.508), duration: 1)
        redCard.runAction(SKAction.repeatAction(moveBackRed, count: 1))
        
        let moveBackBlue = SKAction.moveTo(CGPointMake(1382.985, 472.673), duration: 1)
        
        blueCard.runAction(SKAction.repeatAction(moveBackBlue, count: 1))
        
        
        
        
        
//        let returnToSize = SKAction.resizeToWidth(702, height: 143, duration: 1)
//        redCard.runAction(SKAction.repeatAction(returnToSize, count: 1))
//        let moveBack = SKAction.moveTo(CGPointMake(400, 600), duration: 1)
//        redCard.runAction(SKAction.repeatAction(moveBack, count: 2))
        
//        let shrinkBack = SKAction.resizeToWidth(300, height: 450, duration: 1)
//        let rotate = SKAction.rotateByAngle(CGFloat(M_PI), duration:0.5)

//        redCard.runAction(SKAction.repeatAction(rotate, count: 2))
//        redCard.runAction(SKAction.repeatAction(shrinkBack, count: 2))
        
        
        
        //update labels after completing the wait action
//        redCard.runAction(SKAction .waitForDuration(2), completion: {
//            self.updateLabels()
//           
//            })
        
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("contact")
    }
}
