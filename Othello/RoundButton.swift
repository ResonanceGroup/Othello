//
//  RoundButton.swift
//  Othello
//
//  Created by MacUser on 1/3/18.
//  Copyright © 2018 MacUser. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.green {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
