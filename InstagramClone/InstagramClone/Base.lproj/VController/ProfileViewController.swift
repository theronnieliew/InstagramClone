//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Students on 11/14/16.
//  Copyright © 2016 Panda^4. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsect = UIEdgeInsetsMake(0.0, 15.0, 0.0, 15.0)
    @IBOutlet weak var userUserNameLabel: UILabel!
    @IBOutlet weak var profileCollectionView: UICollectionView! {
        didSet{
            profileCollectionView.dataSource = self
            profileCollectionView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editProfileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "userEditSegue", sender: self)
    }

}

extension ProfileViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileDetailCell", for: indexPath) as! UserDetailCollectionViewCell
            cell.userProfileImage.image = UIImage (named: "instagram-logo-icon-6119")
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profilePostCell", for: indexPath) as! UserPostCollectionViewCell
            cell.backgroundColor = UIColor.black
            return cell
        }
    }
}


extension ProfileViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0
        {
            let width = 375
            let height = 195
            return CGSize(width: width, height: height)
        }
        else
        {
            let Space = sectionInsect.left * (itemsPerRow + 1)
            let Width = view.frame.width - Space
            let widthPerItem = Width / itemsPerRow
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsect
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsect.left
    }
}
