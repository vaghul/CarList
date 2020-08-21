//
//  ApiUrl.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import Foundation

public enum ApiUrl: String {
    // endpoint configuration can be adapted to use config based url loading if required
    
    case CarList = "https://carfax-for-consumers.firebaseio.com/assignment.json"

    var url: URL? {
           return URL(string: self.rawValue)
       }
}
