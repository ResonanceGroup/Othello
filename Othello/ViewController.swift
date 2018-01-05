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

    private var p_player: Player = .blackPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var othelloButton: [RoundButton]!
  
    
    @IBAction func touchButton(_ sender: RoundButton) {
    updateButtonColor()
    }

    private func updateButtonColor()
    {
        for index in othelloButton.indices
        {
        let button =  othelloButton[index]
        }
        //hmmmm
        button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
    }
}


