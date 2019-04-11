//
//  UIViewController+ActivityIndicator.swift
//  RMCharacters
//
//  Created by Alexey Yashin on 2019-04-11.
//  Copyright © 2019 Alexey Yashin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var activityIndicatorTag: Int { return 999999 }
    
    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = .gray,
        location: CGPoint? = nil) {
        
        let loc = location ?? self.view.center
        
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: style)
            
            activityIndicator.tag = self.activityIndicatorTag
            
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter (
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}

