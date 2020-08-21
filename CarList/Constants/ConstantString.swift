//
//  ConstantString.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import Foundation

// constant string used in the app
class ConstantString {
    
    static let shared = ConstantString()
    
    let CARLISTCELL = "CARRECYCLECELL"
    
    
    // place holder can be replaced by localized string to add multilanguage support in future
    
    let PLACEHOLDERHOMETITLE = "Car Listing"
    
    let PLACEHOLDEREMPTYDIRECTORY = "Empty Directory"
    let PLACEHOLDERERRORMESSAGE = "Error Occured"
    let PLACEHOLDERERRORAPI = "Api Error"
    let PLACEHOLDERERRORDECODE = "Decode Error"
    let PLACEHOLDERERRORDATACORRUPTED = "Decode Data Corrupted"
    let PLACEHOLDERERRORDATAKEYNA = "Decode Key Not available"
    let PLACEHOLDERERRORDATATYPENA = "Decode Data Type Mismatch"
    let PLACEHOLDERERRORDATAINVALIDENDPOINT = "Invalid Endpoint"
    let PLACEHOLDERERRORRESPONSEINVALID = "Invalie Response"
    let PLACEHOLDERERRORNODATA = "No Data"
    let PLACEHOLDERERRORDATAVALUENA = "Decode Value not available"
    let PLACEHOLDERERRORCONNECTIVITY = "Internet Connectivity Issue"
}
