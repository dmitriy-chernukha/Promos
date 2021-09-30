//
//  UserDetailsViewController.swift
//  PromosTestTask
//
//  Created by Dim on 30.09.2021.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var viewModel: UserDetailsViewModelProtocol!
    
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var lantLabel: UILabel!
    @IBOutlet weak var lngLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()

    }
    
    private func configureViews() {
        
        if let user = viewModel.user {
            userIDLabel.text = "\(user.id)"
            nameLabel.text = user.name
            userNameLabel.text = user.username
            emailLabel.text = user.email
            phoneLabel.text = user.phone
            websiteLabel.text = user.website
            streetLabel.text = user.address?.street
            cityLabel.text = user.address?.city
            zipcodeLabel.text = user.address?.zipcode
            lantLabel.text = user.address?.geo.lat
            lngLabel.text = user.address?.geo.lng
            companyNameLabel.text = user.company?.name
            catchPhraseLabel.text = user.company?.catchPhrase
            bsLabel.text = user.company?.bs
        }
        
    }
    
}
