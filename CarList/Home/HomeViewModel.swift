//
//  HomeViewModel.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class HomeViewModel:NSObject {
    
    weak var delegate:ModelDelegate?
    var arrayListing:[CarListData]?
    
    func getListingInfo(refValue:ApiMethod) {
         
        HelperNetworkService.shared.fetchResources(url: ApiUrl.CarList.url, method: .GET, params: nil, body: EmptyRequest()) { [unowned self] (result :Result<CarList, APIServiceError>) in
             switch result {
             case .success(let responce):
                 DispatchQueue.main.async {
                    self.arrayListing = responce.listings
                     self.delegate?.recievedResponce(refparam: refValue)
                 }
             case .failure(let error):
                 DispatchQueue.main.async {
                    self.processError(error: error, refvalue: refValue)
                 }
             }
         }
     }
    
    func processError(error:APIServiceError,refvalue:ApiMethod) {
        var errorMessage = ConstantString.shared.PLACEHOLDERERRORMESSAGE
        switch error {
        case .apiError:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORAPI
        case .decodeError:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORDECODE
        case .decodeErrorDataNA:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORDATACORRUPTED
        case .decodeErrorKeyNA:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORDATAKEYNA
        case .decodeErrorTypeNA:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORDATATYPENA
        case .invalidEndpoint:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORDATAINVALIDENDPOINT
        case .invalidResponse:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORRESPONSEINVALID
        case .noData:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORNODATA
        case .decodeErrorValueNA:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORDATAVALUENA
        case  .connectivityIssue:
            errorMessage = ConstantString.shared.PLACEHOLDERERRORCONNECTIVITY
        }
        delegate?.errorResponce(errorMessage, refparam: refvalue)
    }
    
    
    func getnumberOfIndex(in section:Int) -> Int{
        if section == 0 {
            return self.arrayListing?.count ?? 0
        }
        return 0
    }
    
    func getListing(for indexpath:IndexPath) -> CarListData? {
          return arrayListing?[indexpath.item]
    }
    
    func getImageUrl(for indexpath:IndexPath) -> String? {
        return arrayListing?[indexpath.item].images?.firstPhoto?.large
    }

}
