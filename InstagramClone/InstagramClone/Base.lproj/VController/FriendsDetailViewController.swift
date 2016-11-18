//
//  FriendsDetailViewController.swift
//  InstagramClone
//
//  Created by Students on 11/14/16.
//  Copyright © 2016 Panda^4. All rights reserved.
//

import UIKit

class FriendsDetailViewController: UIViewController {
    let itemsPerRow: CGFloat = 3
    var i = 0
    let picture = [UIImage (named: "busuk"), UIImage (named:"busuk2"), UIImage (named:"busuk3"), UIImage (named:"busuk4")]
    fileprivate let sectionInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
    @IBOutlet weak var friendsCollectionView: UICollectionView!{
        didSet{
            friendsCollectionView.dataSource = self
            friendsCollectionView.delegate = self
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Najib / Najis"
        titleLabel.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FriendsDetailViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picture.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == 0)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsDetailCollectionCell", for: indexPath) as! FriendsDetailCollectionViewCell
        
            cell.friendProfileImage.image = UIImage(named:"busuk")
            cell.fullnameLabel.text = "Ah Jib Gor"
            return cell

        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsPostCell", for: indexPath) as! FriendPostCollectionViewCell
            cell.friendsPostImage.image = picture[i]
                i += 1
            
            return cell
        }
        

    }
        
    
    
}

extension FriendsDetailViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize
    {
        if indexPath.row == 0
        {
            let width = 375
            let height = 195
            return CGSize(width: width, height: height)
        }
        else
        {
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width : widthPerItem, height : widthPerItem)
        
        }
        
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}















