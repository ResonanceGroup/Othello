//
//  enums.swift
//  Othello
//
//  Created by MacUser on 1/5/18.
//  Copyright © 2018 MacUser. All rights reserved.
//

import Foundation


enum Player{
    case blackPlayer
    case whitePlayer
}

enum TileState{
    case neutral
    case black
    case white
}

enum direction{
    case North
    case South
    case East
    case West
    case NorthEast
    case NorthWest
    case SouthEast
    case SouthWest
    
    static let cases: [direction] = [.North, South, East, West, NorthEast, NorthWest, SouthEast, SouthWest]
}
