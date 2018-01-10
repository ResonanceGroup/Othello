//
//  othelloModel.swift
//  Othello
//
//  Created by MacUser on 1/9/18.
//  Copyright © 2018 MacUser. All rights reserved.
//

import Foundation

class othelloModel{
    
    func getTileChain(startbutton: RoundButton, chainDirection: direction)->Array<RoundButton>
    {
        var returnChain: [RoundButton] = [startbutton]
        
        if var addedButton = startbutton.getNeighbour(direction: chainDirection)
        {
            while addedButton.currentState != .neutral && addedButton.currentState != startbutton.currentState
            {
                returnChain.append(addedButton)
                
                if let temp = addedButton.getNeighbour(direction: chainDirection){
                    addedButton = temp
                } else {
                    break
                }
            }
            
            if addedButton.currentState == startbutton.currentState{
                returnChain.append(addedButton)
            }
        }
        
        return returnChain
    }
    
    func legalMovePresent(startButton: RoundButton, chainDirection: direction, currentPlayer: Player)->Bool
    {
        var chain: [RoundButton] = [startButton]
        
        var theoryTileState: TileState
        
        switch currentPlayer{
        case .blackPlayer:
            theoryTileState = .black
        case .whitePlayer:
            theoryTileState = .white
        }
        
        if var addedButton = startButton.getNeighbour(direction: chainDirection)
        {
            while addedButton.currentState != .neutral && addedButton.currentState != theoryTileState
            {
                chain.append(addedButton)
                
                if let temp = addedButton.getNeighbour(direction: chainDirection){
                    addedButton = temp
                } else {
                    break
                }
            }
            
            if addedButton.currentState == theoryTileState{
                chain.append(addedButton)
            }
        }
        
        if chain.count >= 3 && (chain[chain.endIndex - 1].currentState ==  theoryTileState){
            return true
        } else {
            return false
        }
    }
}
