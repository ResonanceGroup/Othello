//
//  Extensions.swift
//  Othello
//
//  Created by MacUser on 1/16/18.
//  Copyright © 2018 MacUser. All rights reserved.
//

import Foundation

import UIKit

extension NSObject {
    
    // Delays execution of the current thread (non-blocking) until the reference flag variable is set to false
    class func delayWithFlag( flag: inout Bool, invert: Bool = false) {
        let theRL: RunLoop = RunLoop.current
        if invert {
            while !flag && theRL.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate.distantFuture) { }
        } else {
            while flag && theRL.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate.distantFuture) { }
        }
    }
}
