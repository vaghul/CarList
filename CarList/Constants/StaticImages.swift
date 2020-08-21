//
//  StaticImages.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

// place holder or static images are used as singleton so that multiple refrence of the same is not created and only referenced
class StaticImages {
    
    static let shared = StaticImages()
 
    let PLACEHOLDERUSER = UIImage(named: "avatar")
}
