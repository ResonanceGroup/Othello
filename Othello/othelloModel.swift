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
        
        if let addedButton = startbutton.getNeighbour(direction: chainDirection)
        {
            
        }
        
        return returnChain
    }
    
}
