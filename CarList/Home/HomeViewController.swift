//
//  HomeViewController.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var viewComponent: HomeView? { return self.view as? HomeView }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        self.view = HomeView(frame: self.view.frame)
        //viewComponent?.delegate = self
        
        
    }

}

