//
//  Questions.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright © 2016 Fourteen66. All rights reserved.
//

import Foundation

class Questions{
    
    var set3 = [["Smell like manure","Smell like urine"],
                ["Not be able to talk","Not be able to walk"],
                ["Spit at an angry Mike Tyson","Spit at an angry Bruce Lee"],
                ["Have an extra limb","Have an extra eyeball"],
                ["Eat only Chinese food all the time ","Eat only Mexican food all the time"],
                ["Have a slight lisp","Have a slight cockeye"],
                ["Chop off your own arm","Chop off a complete strangers arm, but they come back to kill you in 30 years"],
                ["Have Morgan Freeman narrate your life","Have Chuck Norris narrate your life"],
                ["be without elbows","be without knees"],
                ["experience a sharp pain in your side each time someone says your name","have a bell sound each time you are aroused"]]
    
    
    
    private func getRandomNumber() -> Int{
        let randomNumber = Int(arc4random_uniform(UInt32(set3.count)))
        return randomNumber
    }
   
    
    func getSet3() -> [String]{
        return set3[getRandomNumber()]
    }
}
