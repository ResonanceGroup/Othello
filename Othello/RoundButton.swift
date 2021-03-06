//
//  RoundButton.swift
//  Othello
//
//  Created by MacUser on 1/3/18.
//  Copyright © 2018 MacUser. All rights reserved.
//
import UIKit
import Foundation

@IBDesignable
class RoundButton: UIButton
{
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    public private(set) var p_tilePosition = CGPoint(x: -1, y: -1)
    
    public private(set) var p_position = CGPoint(x: -1, y: -1)
    
    public private(set) var neighbours:[RoundButton] = []
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setTilePosition(){
        p_tilePosition.x = round(self.frame.origin.x / (self.frame.size.width + 8.0))// The 8 here is the standard spacing between sibling views
      //  self.frame.origin.x
        p_position.x = self.frame.origin.x
        if let yPosition = self.superview?.frame.origin.y{
            p_tilePosition.y = round(yPosition / (self.frame.size.height + 8.0))
            p_position.y = yPosition
        }
    }
    
    var currentState: TileState = .neutral{
        didSet{
           
            switch currentState{
            case .neutral:
               
                UIView.transition(with: self, duration: 0.6, options: [.curveEaseIn], animations: {self.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)} )
            case .black:
                UIView.transition(with: self, duration: 0.6, options: [.transitionFlipFromLeft], animations: {self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)} )
            case .white:
                UIView.transition(with: self, duration: 0.6, options: [.transitionFlipFromRight], animations: {self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)} )
            }
        }
    }
    
    func addNeighbour(neighbour: RoundButton)
    {
        neighbours.append(neighbour)
    }
    
    func calculateDistanceTo(button: RoundButton)->Double
    {
        return sqrt(Double(pow(self.p_tilePosition.x - button.p_tilePosition.x, 2.0) + pow(self.p_tilePosition.y - button.p_tilePosition.y, 2.0)))
    }
    
    func getNeighbour(direction: direction)->RoundButton?
    {
        var foundNeighbour: RoundButton? = nil
        
        switch direction{
        case .North:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x) && (button.p_tilePosition.y == self.p_tilePosition.y - 1))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .South:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x) && (button.p_tilePosition.y == self.p_tilePosition.y + 1))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .East:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x + 1) && (button.p_tilePosition.y == self.p_tilePosition.y))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .West:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x - 1) && (button.p_tilePosition.y == self.p_tilePosition.y))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .NorthEast:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x + 1) && (button.p_tilePosition.y == self.p_tilePosition.y - 1))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .NorthWest:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x - 1) && (button.p_tilePosition.y == self.p_tilePosition.y - 1))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .SouthEast:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x + 1) && (button.p_tilePosition.y == self.p_tilePosition.y + 1))
                {
                    foundNeighbour = button
                    break
                }
            }
        case .SouthWest:
            for button in neighbours{
                if((button.p_tilePosition.x == self.p_tilePosition.x - 1) && (button.p_tilePosition.y == self.p_tilePosition.y + 1))
                {
                    foundNeighbour = button
                    break
                }
            }
        }
    
        return foundNeighbour
    }
    
    var cornerRadius: CGFloat = 0
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0
        {
        didSet
        {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.green
        {
        didSet
        {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var diameter: CGFloat = 36
        {
        didSet{
            self.frame.size = CGSize(width: diameter, height: diameter)
            
            self.cornerRadius = diameter / 2.0
        }
    }
    
}
