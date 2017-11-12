//
//  ProcessModel.swift
//  Sen'o
//
//  Created by Odaryna on 11/11/17.
//  Copyright © 2017 Odaryna. All rights reserved.
//

import Foundation

class ProcessModel {
    
    class func expectedValue(x:Double) -> (Double) {
        return 1.5 * (x * x + 2) - 3 * sin(x * 2)
    }
    
    class func dispersion(x:Double) -> (Double) {
        return 0.15 * (x * x + 2) * (x * x + 2)
    }
    
    class func correlation(x:Double) -> (Double) {
        return 0
    }
}
