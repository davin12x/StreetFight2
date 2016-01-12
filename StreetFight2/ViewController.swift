//
//  ViewController.swift
//  StreetFight2
//
//  Created by Lalit on 2016-01-12.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player : Player!
    var enemy :Enemy!
    var backMusic : AVAudioPlayer!
    
    
    @IBOutlet weak var angelAttackImage: UIButton!
    @IBOutlet weak var deamonAttackImage: UIButton!
    @IBOutlet weak var resetImage: UIButton!
    @IBOutlet weak var DeamonHp: UILabel!
    @IBOutlet weak var AngelHp: UILabel!
    @IBOutlet weak var resetLabel: UILabel!
    @IBOutlet weak var PrintLabel: UILabel!
    @IBOutlet weak var dmonAttackLabel: UILabel!
    @IBOutlet weak var angelAttackLabel: UILabel!
   
    @IBAction func onResetPressed(sender: AnyObject) {
        resetImage.hidden = true
        angelAttackImage.hidden = false
        deamonAttackImage.hidden = false
        resetLabel.hidden = true
        dmonAttackLabel.hidden = false
        angelAttackLabel.hidden = false
        DeamonHp.hidden = false
        AngelHp.hidden = false
        viewDidLoad()
        
    }
    
    @IBAction func onDemonAttackPressed(sender: AnyObject) {
        actionSound()
        self.angelAttackImage.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableButton", userInfo: nil, repeats: false)
        
        if player.attemptAttack(player.attackPwr){
            PrintLabel.text = "Attacked by \(enemy.name)"
            AngelHp.text = "\(player.hp)"
        }
        if !player.isCharacterAlive(){
            DeamonHp.text = ""
            PrintLabel.text = "Dailbor Wins"
            resetGame()
        }
    }
    
    func enableButton(){
        self.angelAttackImage.enabled = true
        self.deamonAttackImage.enabled = true
    }
    
    func actionSound(){
        let path = NSBundle.mainBundle().pathForResource("Slap", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        do{
            try backMusic = AVAudioPlayer(contentsOfURL: soundURL)
            backMusic.prepareToPlay()
            backMusic.play()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
    }
    func backgroundSound(){
        let path = NSBundle.mainBundle().pathForResource("bckMusic", ofType: "wav")
         let soundURL = NSURL(fileURLWithPath: path!)
        do{
         try backMusic = AVAudioPlayer(contentsOfURL: soundURL)
            backMusic.prepareToPlay()
            backMusic.play()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
        
    
    }
    @IBAction func onAngelAttackPressed(sender: AnyObject) {
        
        actionSound()
        self.deamonAttackImage.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableButton", userInfo: nil, repeats: false)
        if enemy.attemptAttack(enemy.attackPwr){
            PrintLabel.text = "Attacked by \(player.name)"
            DeamonHp.text = "\(enemy.hp)"
            
        }
        if !enemy.isCharacterAlive(){
            DeamonHp.text = ""
            PrintLabel.text = "Igor Wins"
            resetGame()
            
        }
        
    }
    
    func resetGame(){
        
        resetImage.hidden = false
        resetLabel.hidden = false
        angelAttackImage.hidden = true
        deamonAttackImage.hidden = true
        
        dmonAttackLabel.hidden = true
        angelAttackLabel.hidden = true
        DeamonHp.hidden = true
        AngelHp.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeamonHp.text = "100"
        AngelHp.text = "100"
        PrintLabel.text = "Press Attack Button to attack"
        player = Player(hp: 100, attackPwr: 15, name: "Dalibor")
        enemy = Enemy(hp: 100, attackPwr: 20, name: "Igor")
        backgroundSound()
        
    }
}

