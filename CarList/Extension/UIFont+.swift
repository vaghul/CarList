//
//  UIFont+.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

extension UIFont {
    
    // used for universal font styling and easy reference
    
    class var semiboldTitle: UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    class var mediumSubTitle: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .medium)
    }
}
