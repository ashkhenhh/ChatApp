//
//  ContactCell.swift
//  Chat App
//
//  Created by Ashkhen on 7/3/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    func set(_ user: User?) {
        spinner.startAnimating()
        nameLabel.text = user?.name
        ImageDownloadService().download(url: user?.profilePicLink) { [weak self] image in
            self?.profileImageView.image = image
        }
        spinner.stopAnimating()
        spinner.isHidden = true
    }
}
