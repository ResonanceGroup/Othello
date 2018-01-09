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
    private var p_legalMoves = true
    private var p_previousValue = true
    
    private var p_player: Player = .blackPlayer{
        didSet{
            //checks for if legal moves is true and sets it p_previous to true
            if (p_legalMoves == true)
            {
                p_previousValue = true
            }
            //checks if end condition is met
            if (p_legalMoves == false && p_previousValue == false)
            {
            ViewController.endGame()
            
            }
            //checks if player should be skipped and skips them
            if (p_legalMoves == false && p_previousValue == true)
            {
                p_previousValue = false
                if (p_player == .whitePlayer)
                {
                    p_player = .blackPlayer
                }
                else
                {
                    p_player = .whitePlayer
                }
                
            }
            else
            {
                p_previousValue = false
                
            }
            // Check if there are at least 1 legal move
            // If False, chech previose state and if also false, end game
            // If False, check previouse state and if true, set previouse state as false and skip the player's turn
            // If true, reset previouse state to true and continue with the players turn
        }
    }
    
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
      //       Current algorithm for mapping adjacent tiles
            for firstLoop in othelloButton
            {
                for distanceButton in othelloButton
                {
                    let distance = firstLoop.calculateDistanceTo(button: distanceButton)
                    if(distance >= 1.0 && distance <= 1.5)
                    {
                        firstLoop.addNeighbour(neighbour: distanceButton)
                    }
                }
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
        // THis is an addition to the file
    }
    
 
        func endGame(){
            
        }
    }



