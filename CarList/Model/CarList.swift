//
//  CarList.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import Foundation


struct CarList:Codable {
    var listings:[CarListData]?
}

struct CarListData:Codable {
    var images:CarListDataFirstImage?
    var year:Int?
    var make:String?
    var model:String?
    var trim:String?
    var listPrice:Double?
    var mileage:Double?
    var dealer:CarListDealer
    
}

struct CarListDataFirstImage:Codable {
    var firstPhoto:CarListDataImage?
}

struct CarListDataImage:Codable {
    var large:String?
    var medium:String?
    var small:String?
}

struct CarListDealer:Codable {
    var city:String?
    var state:String?
    var phone:String?
    
}
