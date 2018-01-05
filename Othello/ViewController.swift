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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var othelloButton: [RoundButton]!
  
    
    @IBAction func touchButton(_ sender: RoundButton) {
        if(sender.backgroundColor == #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)){
            switch p_player{
            case .blackPlayer:
                sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                p_player = .whitePlayer
            case .whitePlayer:
                sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                p_player = .blackPlayer
            }
        }
    }
    
    @IBAction func touchReset(_ sender: UIButton) {
        for button in othelloButton{
            
        }
        
        p_player = .blackPlayer
        p_whiteCount = 2
        p_blackCount = 2
        
        whitePiecesText.text = String(p_whiteCount)
        p_blackPiecesText.text = String(p_blackCount)
    }
}


