//
//  HomeViewController.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UITableViewController {
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.isHidden = true
//        // Do any additional setup after loading the view.
//
        viewModel.delegate = self
        registerTableView()
        //self.tableView.rowHeight = 350
        navigationItem.title = ConstantString.shared.PLACEHOLDERHOMETITLE
        tableView.separatorColor = .separator
        startloading()

        
    }
    
    private func registerTableView() {
        self.tableView.register(CarListTableViewCell.self, forCellReuseIdentifier: ConstantString.shared.CARLISTCELL)
    }
    
    private func startloading() {
        self.showSpinner()
        viewModel.getListingInfo(refValue: .CarList)
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getnumberOfIndex(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantString.shared.CARLISTCELL, for: indexPath) as! CarListTableViewCell
        cell.selectionStyle = .none
        cell.clipsToBounds = true
        if let listing = viewModel.getListing(for: indexPath) {
            cell.setCellValue(listing: listing)
            cell.imageviewListing.image = StaticImages.shared.PLACEHOLDERUSER
            if let imageurl = viewModel.getImageUrl(for: indexPath), imageurl != "" {
                if let url = URL(string:imageurl) {
                    KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { result in
                        switch result {
                        case .success(let value):
                            cell.imageWithImage(image: value.image)
                            //print("Image: \(value.image). Got from: \(value.cacheType)")
                        case .failure(let error):
                            print("Error: \(error)")
                        }
                    }
                }
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    //

    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cellValue = cell as? CarListTableViewCell {
            cellValue.imageviewListing.kf.cancelDownloadTask()
        }
    }
}


extension HomeViewController : ModelDelegate {
    func recievedResponce(refparam: ApiMethod) {
        self.removeSpinner()
        tableView.reloadData()
    }
    
    func errorResponce(_ value: String, refparam: ApiMethod) {
        self.removeSpinner()
        showAlert(message: value)
        
    }
    
    func showAlert(message:String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
