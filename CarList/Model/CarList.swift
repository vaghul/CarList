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
    
    func getListingTitle() -> String {
        var heading:[String] = []
        if let year = self.year {
            heading.append("\(year)")
        }
        if let make = self.make {
            heading.append(make)
        }
        if let model = self.model {
            heading.append(model)
        }
        if let trim = self.trim, trim != "Unspecified" {
            heading.append("- \(trim)")
        }
        return heading.joined(separator: " ")
    }
    
    func getListingLocation() -> String? {
        var location = ""
        if let city = self.dealer.city {
             if let state = self.dealer.state {
                 location = "\(city), \(state)"
             }else{
                 location = "\(city)"
             }
         }else if let state = self.dealer.state {
                 location = "\(state)"
         }
        return (location != "") ? location : nil
    }
    
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
