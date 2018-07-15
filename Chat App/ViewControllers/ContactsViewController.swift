//
//  ContactsViewController.swift
//  Chat App
//
//  Created by Ashkhen on 7/3/18.
//  Copyright © 2018 Ashkhen. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

protocol ContactsViewControllerDelegate {
    func didSelectUser(id: String)
}


class ContactsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let manager = UserManager()
    var users = [User]()
    var delegate: ContactsViewControllerDelegate?

    
    
  
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.set(users[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 40) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userID = users[indexPath.row].id
        delegate?.didSelectUser(id: userID)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.allUsers { [weak self] results in
            self?.users = results
            self?.collectionView.reloadData()
        }
    }
    

}
