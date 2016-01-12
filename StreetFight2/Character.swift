//
//  Character.swift
//  StreetFight2
//
//  Created by Lalit on 2016-01-12.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation

class Character{
    
    private var _hp :Int
    private var _attackPwr :Int
    
    var hp : Int{
        get{
           return _hp
        }
    }
    
    var attackPwr : Int{
        get{
            return _attackPwr
        }
    }
    private var _name = "Player "
    
    var name : String{
        return _name
    }
    
    func isCharacterAlive()->Bool{
        if hp <= 0{
            return false
        }
        else{return true}
    }
    init(startingHp:Int, attackPwr: Int, name : String){
        self._attackPwr = attackPwr
        self._hp = startingHp
        self._name = name
    }
    func attemptAttack(attackPower:Int)->Bool
    {
        self._hp = _hp - attackPower
        return true
    }
    
    
}


