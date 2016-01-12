//
//  Enemy.swift
//  StreetFight2
//
//  Created by Lalit on 2016-01-12.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation

class Enemy : Character{
    
    var type : String{
        return "Grunt"
    }
    convenience init (hp :Int, attackPwr:Int, name: String){
        self.init(startingHp:hp, attackPwr: attackPwr, name : name)
    }
    

}
