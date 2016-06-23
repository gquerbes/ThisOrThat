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
    
    
    
    
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        //self.backgroundColor = UIColor.cyanColor()
        
        //set self to be physics world delegate
        self.physicsWorld.contactDelegate = self
        
        //cards posistioning
        redCard = self.childNode(withName: "redCard") as! SKSpriteNode
        blueCard = self.childNode(withName: "blueCard") as! SKSpriteNode
        redCard.zPosition = 0
        blueCard.zPosition = 0
        
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
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown(_:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        


       
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//
//        }
//    }

    
    
    /**
     Update questions on the card
    */
    func updateLabels(){
        
        
        //initialize RED label
        let redLabel = SKMultilineLabel(text: "This", labelWidth: 100, pos: CGPoint(x: 0, y: 0 ),leading: 20, fontSize:10)
        
        //set red label on card
        redLabel.zPosition = 1
        //redCard.addChild(redLabel)
        
        //initialize BLUE label
        let blueLabel = SKMultilineLabel(text: "That", labelWidth: 280, pos: CGPoint(x: 0, y: 0 ),leading: 10, fontSize:10)
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
    func swipedRight(_ sender:UISwipeGestureRecognizer){
        
        print("right swipe")
        let moveInDirection = SKAction.move(by: CGVector(dx: 300, dy: 300), duration: 1)
        redCard.run(moveInDirection)
        
//        let moveToRight = SKAction.moveTo(x: 1000, duration: 1.0)
//        redCard.run(SKAction.repeat(moveToRight, count: 1))
  
        let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration: 0.5)
        redCard.run(SKAction.repeat(action, count: 2))
        
    }
    
    /**
     process a left swipe
     */
    func swipedLeft(_ sender:UISwipeGestureRecognizer){
    
    }
    
    
    /**
     process a down swipe
     */
    func swipedDown(_ sender:UISwipeGestureRecognizer){
        
        let moveInDirection = SKAction.move(by: CGVector(dx: -300, dy: -300), duration: 1)
        redCard.run(moveInDirection)

        
        let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration: 0.5)
        redCard.run(SKAction.repeat(action, count: 2))
                
        
        //update labels after completing the wait action
        redCard.run(SKAction.wait(forDuration: 2), completion: {
            self.updateLabels()
           
            })
    
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact")
    }
}
