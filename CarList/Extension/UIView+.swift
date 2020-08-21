//
//  UIView+.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeRoundedEdges(radius:CGFloat){
           self.layer.cornerRadius = radius
           self.layer.masksToBounds = true
       }
    
}
