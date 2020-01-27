//
//  HUD.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 27/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HUD {
    let container: UIView = UIView()
    let loadingView: UIView = UIView()
    let label = UILabel()
    
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: HUD {
        struct Static {
            static let instance: HUD = HUD()
        }
        return Static.instance
    }
    
    public func showLoading(_ view: UIView) {
        container.frame = view.frame
        container.center = view.center
        
        container.backgroundColor = UIColor(hex: "#33333344")
    
        loadingView.frame = CGRect(x: 0, y: 0, width: 220, height: 120)
        loadingView.center = view.center
        loadingView.backgroundColor = UIColor(hex: "#333333DD")
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
    
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = UIColor.white
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,
                                           y: (loadingView.frame.size.height / 2) - 15)
    
        let textString = "Consultando as estrelas..."
        label.text = textString
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = .white
        label.sizeToFit()
        label.center = CGPoint(x: activityIndicator.center.x, y: activityIndicator.center.y + 40)
    
        loadingView.addSubview(activityIndicator)
        loadingView.addSubview(label)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    public func hideLoading() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
}
