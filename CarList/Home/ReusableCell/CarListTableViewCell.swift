//
//  CarListTableViewCell.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

protocol CarListTableViewCellDelegate:class {
    func onClickCall(indexPath:IndexPath)
}

class CarListTableViewCell: UITableViewCell {
    
    weak var delegate:CarListTableViewCellDelegate?
    var indexPath:IndexPath!

    var imageviewListing:UIImageView = {
        let temp = UIImageView()
        temp.backgroundColor = .appBackgroundColor
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()

    var labelListHeading:UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .appBackgroundColor
        temp.textColor = .label
        temp.font = .semiboldTitle
        return temp
    }()
    
    var viewListPrice:ViewMultiLabel = {
        let temp = ViewMultiLabel()
        return temp
    }()
    
    var viewListMiles:ViewMultiLabel = {
        let temp = ViewMultiLabel()
        return temp
    }()
    
    var viewListLocation:ViewMultiLabel = {
        let temp = ViewMultiLabel()
        return temp
    }()
    
    var buttonCall:UIButton = {
        let temp = UIButton()
        temp.setTitleColor(.systemBlue, for: .normal)
        temp.setTitleColor(.appBackgroundColor, for: .highlighted)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .appBackgroundColor
        temp.titleLabel?.font = .mediumSubTitle
        return temp
    }()
    
    var lineSeperator:UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .seperatorColor
        return temp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
            
        
        contentView.addSubview(imageviewListing)
        
        imageviewListing.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        imageviewListing.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        imageviewListing.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        imageviewListing.makeRoundedEdges(radius: 20)

        contentView.addSubview(labelListHeading)
        
        let viewStack = UIStackView(arrangedSubviews: [labelListHeading,viewListPrice,viewListMiles,viewListLocation])
        viewStack.alignment = .leading
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        viewStack.axis = .vertical
        viewStack.distribution = .fillEqually
        viewStack.spacing = 5
        
        contentView.addSubview(viewStack)
        
        viewStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        viewStack.topAnchor.constraint(equalTo: imageviewListing.bottomAnchor,constant: 10).isActive = true
        viewStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        contentView.addSubview(buttonCall)

        buttonCall.topAnchor.constraint(equalTo: viewStack.bottomAnchor, constant: 10).isActive = true
        buttonCall.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        buttonCall.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonCall.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentView.addSubview(lineSeperator)

        lineSeperator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        lineSeperator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        lineSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeperator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1).isActive  = true
        
        buttonCall.addTarget(self, action: #selector(onClickCall), for: .touchUpInside)
        
    }
    
    @objc func onClickCall(){
        delegate?.onClickCall(indexPath: indexPath)
    }
    
    func setCellValue(listing: CarListData) {
        
        labelListHeading.text = listing.getListingTitle()
        viewListPrice.isHidden = true
        viewListMiles.isHidden = true
        viewListLocation.isHidden = true
        buttonCall.isHidden = true
        if let price = listing.listPrice {
            viewListPrice.isHidden = false
            viewListPrice.setViewElement(title: price.getCurrency(), type: .price)
        }
        if let miles = listing.mileage {
            viewListMiles.isHidden = false
            viewListMiles.setViewElement(title: "\(miles) MI", type: .miles)
        }
        if let location = listing.getListingLocation(){
            viewListLocation.isHidden = false
            viewListLocation.setViewElement(title: "\(location)", type: .location)
        }
        
        if let phone = listing.dealer.phone {
            buttonCall.isHidden = false
            buttonCall.setTitle(phone.toPhoneNumber(), for: .normal)
        }
    }
    
    func imageWithImage(image:UIImage){
        let newSize = imageviewListing.bounds.size
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        imageviewListing.image = newImage
    }
}
