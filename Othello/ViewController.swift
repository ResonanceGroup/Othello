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
            if (p_legalMoves == true)
            {
                    p_previousValue = true
            }
            else if (p_legalMoves == false && p_previousValue == false)
            {
            //end game
            }
            else{
                if (p_player == .whitePlayer)
                {
                    p_previousValue = false
                    p_player =  .blackPlayer
                }
                else
                {
                    p_previousValue = false
                    p_player = .whitePlayer
                }
            }
//            // Check if there are at least 1 legal move
//            // If False, chech previose state and if also false, end game
//            // If False, check previouse state and if true, set previouse state as false and skip the player's turn
//            // If true, reset previouse state to true and continue with the players turn
        }
    }
    
    private var p_whiteCount: Int8 = 2
    
    private var p_blackCount: Int8 = 2
    private var legalMoves = true
    private var previousValue = true
    private var currentValue = true
    
    private var p_gameModel: othelloModel = othelloModel()
    
    private func updatePlayersTurnTextLabel()
    {
        switch p_player {
        case .blackPlayer:
            let attributesBlackText: [NSAttributedStringKey:Any] =
                [
                    .strokeWidth : 10.0,
                    .strokeColor : UIColor.black
                ]
            let attributedStringBlackText = NSAttributedString(string: "Black Players Turn", attributes: attributesBlackText)
            playersTurnText.attributedText = attributedStringBlackText
            playersTurnCircleLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        case .whitePlayer:
            let attributesWhiteText: [NSAttributedStringKey:Any] =
                [
                    .strokeWidth : 10.0,
                    .strokeColor : UIColor.white
            ]
            let attributedStringWhiteText = NSAttributedString(string: "White Players Turn", attributes: attributesWhiteText)
            playersTurnText.attributedText = attributedStringWhiteText
                 playersTurnCircleLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        }
    }

    @IBOutlet weak var playersTurnText: UILabel!
   
    @IBOutlet weak var playersTurnCircleLabel: RoundLabel!
    
    @IBOutlet weak var whitePiecesText: UILabel!
    
    @IBOutlet weak var p_blackPiecesText: UILabel!
    
    @IBOutlet var othelloButton: [RoundButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        for button in othelloButton{
            button.setTilePosition()
            button.setTilePosition()
            switch button.p_tilePosition{
            case CGPoint(x: 3, y: 3), CGPoint(x: 4, y: 4):
                button.currentState = .white
            case CGPoint(x: 4, y: 3), CGPoint(x: 3, y: 4):
                button.currentState = .black
            default:
                button.currentState = .neutral
                break
            }
        }
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchButton(_ sender: RoundButton) {
        
        if(sender.currentState == .neutral){
          
          
            switch p_player{
        
            case .blackPlayer:
                sender.currentState = .black
                
                var incrementValue: Int8 = 1
                var decrementValue: Int8 = 0
                
                for tileDirection in direction.cases{
                    let chain = p_gameModel.getTileChain(startbutton: sender, chainDirection: tileDirection)
                    
                    if(chain.count >= 3){
                        if(chain[0].currentState == chain[chain.endIndex - 1].currentState)
                        {
                            incrementValue = incrementValue + Int8(chain.count - 2)
                            for button in chain{
                                if button.currentState != .black{
                                    button.currentState = .black
                                }
                            }
                        }
                    }
                }
                
                p_blackCount = p_blackCount + incrementValue
                p_whiteCount = p_whiteCount - (incrementValue - 1)
                p_blackPiecesText.text = String(p_blackCount)
                whitePiecesText.text = String(p_whiteCount)
                p_player = .whitePlayer
                updatePlayersTurnTextLabel()
            case .whitePlayer:
                sender.currentState = .white
                
                var incrementValue: Int8 = 1
                
                for tileDirection in direction.cases{
                    let chain = p_gameModel.getTileChain(startbutton: sender, chainDirection: tileDirection)
                    
                    if(chain.count >= 3){
                        if(chain[0].currentState == chain[chain.endIndex - 1].currentState)
                        {
                            incrementValue = incrementValue + Int8(chain.count - 2)
                            for button in chain{
                                if button.currentState != .white{
                                    button.currentState = .white
                                }
                            }
                        }
                    }
                }
                
                p_whiteCount = p_whiteCount + incrementValue
                p_blackCount = p_blackCount - (incrementValue - 1)
                 p_blackPiecesText.text = String(p_blackCount)
                whitePiecesText.text = String(p_whiteCount)
                p_player = .blackPlayer
                updatePlayersTurnTextLabel()
            }
        }
    }
    
    @IBAction func touchReset(_ sender: UIButton) {
        for button in othelloButton{
            switch button.p_tilePosition{
            case CGPoint(x: 3, y: 3), CGPoint(x: 4, y: 4):
                if button.currentState != .white{
                    button.currentState = .white
                }
            case CGPoint(x: 4, y: 3), CGPoint(x: 3, y: 4):
                if button.currentState != .black{
                    button.currentState = .black
                }
            default:
                button.currentState = .neutral
            }
        }
    
        p_player = .blackPlayer
        p_whiteCount = 2
        p_blackCount = 2
        
        whitePiecesText.text = String(p_whiteCount)
        p_blackPiecesText.text = String(p_blackCount)
        updatePlayersTurnTextLabel()
        // THis is an addition to the file
    }
    
    func isGameover(){
//        //Declare variables in class
//        currentValue = legalMoves
//
//        if (currentValue == false && previousValue == false){
//         //   endGame()
//        }
//        else{
//           previousValue = currentValue
//            return
//        }
//        func endGame(){
//
        }
    }



