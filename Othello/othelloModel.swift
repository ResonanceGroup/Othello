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
    
}
