//
//  UIViewController+.swift
//  CarList
//
//  Created by Vaghula Krishnan on 2020-08-20.
//  Copyright © 2020 Vaghula Krishnan. All rights reserved.
//

import UIKit

extension UIViewController{
    
    private struct Holder {
        static var vSpinner : UIView?
    }
    
    func showSpinner() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let spinnerView = UIView.init(frame: appDelegate.window?.bounds ?? .zero)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.addSubview(spinnerView)
        }
        
        Holder.vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            Holder.vSpinner?.removeFromSuperview()
            Holder.vSpinner = nil
        }
    }
}
