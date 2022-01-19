//
//  Device.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/13.
//

import UIKit

class Device {
    
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    static let baseWidth: CGFloat = 375
    
    static let baseHeight: CGFloat = 812
    
    static var ratioWidth: CGFloat {
        
        return screenWidth / baseWidth
    }
    
    static var ratioHeight: CGFloat {
        
        return screenHeight / baseHeight
    }
}

extension CGFloat {
    
    var adjustedWidth: CGFloat {
        
        return self * Device.ratioWidth
    }
    
    var adjustedHeight: CGFloat {
        
        return self * Device.ratioHeight
    }
}

extension Double {
    
    var adjustedWidth: CGFloat {
        
        return CGFloat(self) * Device.ratioWidth
    }
    
    var adjustedHeight: CGFloat {
        
        return CGFloat(self) * Device.ratioHeight
    }
}

extension Int {
    
    var adjustedWidth: CGFloat {
        
        return CGFloat(self) * Device.ratioWidth
    }
    
    var adjustedHeight: CGFloat {
        
        return CGFloat(self) * Device.ratioHeight
    }
}
