//
//  ModelProtocol.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import Foundation

// universal protocol for Model

protocol ModelDelegate: class {
    func recievedResponce(refparam: ApiMethod)
    func errorResponce(_ value: String, refparam: ApiMethod)
}

