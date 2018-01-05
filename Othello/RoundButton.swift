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
    
    private var p_tilePosition: CGPoint
    
    override init(frame: CGRect)
    {
        p_tilePosition = CGPoint(x: 0, y: 0)
        super.init(frame: frame)
        setTilePosition()
    }
    
    required init?(coder: NSCoder) {
        p_tilePosition = CGPoint(x: 0, y: 0)
        super.init(coder: coder)
        setTilePosition()
    }
    
    func setTilePosition(){
    
        
        p_tilePosition.x = round(self.layer.position.x / (self.frame.size.width + 8.0))// The 8 here is the standard spacing between sibling views
            p_tilePosition.y = round(self.layer.position.y / (self.frame.size.height + 8.0))

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
