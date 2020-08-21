//
//  String+.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

extension String {
    public func toPhoneNumber() -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1)-$2-$3", options: .regularExpression, range: nil)
    }
    
}


extension Double {
    public func getCurrency() -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter
        }()
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
