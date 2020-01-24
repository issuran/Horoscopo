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
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "zBackgroundImage"))
        signImageView.image = #imageLiteral(resourceName: viewModel.signDetails)
        signTitleLabel.text = viewModel.signDetails
    }
    
}

extension SignDetailsViewController: SignDetailsResultProtocol {
    func success(model: SignDetailsModel?) {
        DispatchQueue.main.async {
            self.signLuckLabel.text = model?.texto ?? ""
            self.authorLabel.text = model?.autor ?? ""
        }
    }
    
    func failure(error: ServiceError) {
        signTitleLabel.text = ":("
        signLuckLabel.text = "As estrelas não estão muito certas de seu futuro para hoje... \nTente novamente mais tarde..."
        authorLabel.text = ""
    }
}
