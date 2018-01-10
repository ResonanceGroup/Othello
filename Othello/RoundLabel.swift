//
//  RoundLabel.swift
//  Othello
//
//  Created by MacUser on 1/10/18.
//  Copyright © 2018 MacUser. All rights reserved.
//

import UIKit
@IBDesignable class RoundLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   @IBInspectable var cornerRadiusLabel: CGFloat = 17
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadiusLabel
        }
    }
    
    @IBInspectable var borderWidthLabel: CGFloat = 1
        {
        didSet
        {
            self.layer.borderWidth = borderWidthLabel
        }
    }
    
    @IBInspectable var borderColorLabel: UIColor = UIColor.black
        {
        didSet
        {
            self.layer.borderColor = borderColorLabel.cgColor
        }
    }
    
    @IBInspectable var diameter: CGFloat = 36
        {
        didSet{
            self.frame.size = CGSize(width: diameter, height: diameter)
            
            self.cornerRadiusLabel = diameter / 2.0
        }
    }
}
