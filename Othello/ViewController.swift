//
//  ViewController.swift
//  Othello
//
//  Created by MacUser on 1/2/18.
//  Copyright © 2018 MacUser. All rights reserved.
//
// Hi Phil ta dah
import UIKit

class ViewController: UIViewController {
    
    private var p_player: Player = .blackPlayer
    
    private var p_whiteCount: Int8 = 2
    
    private var p_blackCount: Int8 = 2
    
    @IBOutlet weak var whitePiecesText: UILabel!
    
    @IBOutlet weak var p_blackPiecesText: UILabel!
    
    @IBOutlet var othelloButton: [RoundButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        for button in othelloButton{
            button.setTilePosition()
            
            switch button.p_tilePosition{
            case CGPoint(x: 4, y: 4), CGPoint(x: 5, y: 5):
                button.currentState = .white
            case CGPoint(x: 5, y: 4), CGPoint(x: 4, y: 5):
                button.currentState = .black
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchButton(_ sender: RoundButton) {
        if(sender.currentState == .neutral){
            switch p_player{
            case .blackPlayer:
                sender.currentState = .black
                p_blackCount += 1
                p_blackPiecesText.text = String(p_blackCount)
                p_player = .whitePlayer
            case .whitePlayer:
                sender.currentState = .white
                p_whiteCount += 1
                whitePiecesText.text = String(p_whiteCount)
                p_player = .blackPlayer
            }
        }
    }
    
    @IBAction func touchReset(_ sender: UIButton) {
        for button in othelloButton{
            switch button.p_tilePosition{
            case CGPoint(x: 4, y: 4), CGPoint(x: 5, y: 5):
                button.currentState = .white
            case CGPoint(x: 5, y: 4), CGPoint(x: 4, y: 5):
                button.currentState = .black
            default:
                button.currentState = .neutral
            }
        }
        
        p_player = .blackPlayer
        p_whiteCount = 2
        p_blackCount = 2
        
        whitePiecesText.text = String(p_whiteCount)
        p_blackPiecesText.text = String(p_blackCount)
    }
}


