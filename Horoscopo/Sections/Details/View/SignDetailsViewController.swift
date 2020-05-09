//
//  SignDetailsViewController.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 24/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SignDetailsViewController: UIViewController {
    
    var viewModel: SignDetailsViewModel!
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signTitleLabel: UILabel!
    @IBOutlet weak var signLuckLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
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
        signImageView.image = #imageLiteral(resourceName: viewModel.signDetails)
        signTitleLabel.text = viewModel.signDetails
        DispatchQueue.main.async {
            HUD.shared.showLoading(self.view)
        }
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
