//
//  ViewMultiLabel.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

enum labelType : String{
    case price
    case miles
    case location
    case phone
}

class ViewMultiLabel: UIView {
    
    private let viewIcon:UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let labelSubHeader:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .mediumSubTitle
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        addSubview(viewIcon)
        
        viewIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        viewIcon.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        viewIcon.heightAnchor.constraint(equalToConstant: 22).isActive = true
        viewIcon.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        addSubview(labelSubHeader)
        
        labelSubHeader.leadingAnchor.constraint(equalTo: viewIcon.trailingAnchor,constant: 10).isActive = true
        labelSubHeader.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        labelSubHeader.heightAnchor.constraint(equalToConstant: 22).isActive = true
        labelSubHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewElement(title:String,type:labelType) {
        viewIcon.image = UIImage(named: type.rawValue)
        labelSubHeader.text = title
    }
}
