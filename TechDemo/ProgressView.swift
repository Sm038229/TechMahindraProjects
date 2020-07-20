//
//  ProgressView.swift
//  TechDemo
//
//  Created by SachchidaNand Mishra on 20/07/20.
//  Copyright © 2020 Sachchida Nand Mishra. All rights reserved.
//

import Foundation
import UIKit

class ProgressView {
    static let shared = ProgressView()
    var alert: UIAlertController? = nil
    
    public func showLoader(for view:UIViewController) {
        alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .gray
        loadingIndicator.startAnimating();
        
        alert!.view.addSubview(loadingIndicator)
        view.present(alert!, animated: true, completion: nil)
    }
    
    public func dismissLoader() {
        if let alertVC = self.alert {
            alertVC.dismiss(animated: false, completion: nil)
        }
    }
}
