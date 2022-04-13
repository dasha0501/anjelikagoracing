//
//  ViewController.swift
//  gbgbggb
//
//  Created by Гость on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {
//1
    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar:  UIImageView!
    @IBOutlet weak var resultLabel:  UILabel!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var linefinish: UIImageView!
//2
    var stateSemafore: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    @objc func pcDrive(){
        //6
        if stateSemafore == 2 {
            pcCar.center.x += 10
        }
    if pcCar.center.x > linefinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "LOSE!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
        
    }
    
    @objc func intervalTimer(){
       
        stateSemafore += 1
        
        if stateSemafore > 2{
           
            stateSemafore = 1
        }
        
        switch stateSemafore {
        case 1:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "DRIVE"
            semaforLabel.textColor = .green
        default:
            break
            
                
        }
    }
@IBAction func startGame(_ sender: UIButton){
        semaforLabel.isHidden = false
        //3
        timerGame =
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
        
        
   
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
    
        
        
