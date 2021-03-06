//
//  SignDetailsViewController.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 24/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds

class SignDetailsViewController: UIViewController {
    
    var viewModel: SignDetailsViewModel!
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signTitleLabel: UILabel!
    @IBOutlet weak var signLuckLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    init(viewModel: SignDetailsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSignDetails()
        createGradientBackground()
        let sign: String = viewModel.signDetails
        signImageView.image = #imageLiteral(resourceName: sign)
        signTitleLabel.text = sign
        DispatchQueue.main.async {
            HUD.shared.showLoading(self.view)
        }
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.service.stopRequestOnGoing()
    }
    
    func createGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        let upColor = UIColor(hex: viewModel.signBackgroundColor)?.cgColor ?? UIColor.white.cgColor
        
        let downColor = UIColor.white.cgColor
                    
        gradientLayer.colors = [upColor, downColor]
        /// To change gradient direction - vertical
//        layer.startPoint = CGPoint(x: 0, y: 0)
//        layer.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.addSublayer(layer)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension SignDetailsViewController: SignDetailsResultProtocol {
    func success(model: SignDetailsModel?) {
        DispatchQueue.main.async {
            self.signTitleLabel.text = self.viewModel.signDetails
            self.signLuckLabel.text = model?.texto ?? ""
            self.authorLabel.text = ""//model?.autor ?? ""
            HUD.shared.hideLoading()
        }
    }
    
    func failure(error: ServiceError) {
        DispatchQueue.main.async {
            self.signTitleLabel.text = ":("
            self.signLuckLabel.text = "As estrelas não estão muito certas de seu futuro para hoje... \nTente novamente mais tarde..."
            self.authorLabel.text = ""
            HUD.shared.hideLoading()
        }
    }
}
