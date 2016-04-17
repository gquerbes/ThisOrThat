//
//  Questions.swift
//  ThisOrThat
//
//  Created by Gabriel Querbes on 4/16/16.
//  Copyright © 2016 Fourteen66. All rights reserved.
//

import Foundation

class Questions{
    
    var questions = ["this","that","the Other","have a real lightsaber","save a starving child","win a new car","save the world","create world peace","wake up in a new Bugatti"]
    
    var set1 = ["Smell like manure","Not be able to talk","Spit at an angry Mike Tyson","Have an extra limb","Eat only Chinese food all the time ","Have a slight lisp","Chop off your own arm","Have Morgan Freeman narrate your life","be without elbows","experience a sharp pain in your side each time someone says your name"]
    
    var set2 = ["Smell like urine","Not be able to walk","Spit at an angry Bruce Lee","Have an extra eyeball","Eat only Mexican food all the time","Have a slight cockeye","Chop off a complete strangers arm, but they come back to kill you in 30 years","Have Chuck Norris narrate your life","be without knees","have a bell sound each time you are aroused"]
    
    var set3 = [["beCool","dont be cool"],["something","something else"]]
    
    private func getRandomNumber() -> Int{
        let randomNumber = Int(arc4random_uniform(UInt32(set3.count)))
        return randomNumber
    }
   
    func getSet1() -> String{
        
        return set1[getRandomNumber()]
    }

    func getSet2() -> String{
        
        return set2[getRandomNumber()]
    }
    
    func getSet3() -> [String]{
        return set3[getRandomNumber()]
    }
}
