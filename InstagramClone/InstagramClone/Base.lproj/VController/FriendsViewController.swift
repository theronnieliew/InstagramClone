//
//  FriendsViewController.swift
//  InstagramClone
//
//  Created by Students on 11/14/16.
//  Copyright © 2016 Panda^4. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var friends = [Friend]()
    var filterFriends = [Friend]()

    @IBOutlet weak var friendsTableView: UITableView!
    {
        didSet{
            friendsTableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        friendsTableView.tableHeaderView = searchController.searchBar
        
        friends = [
            Friend(username: "Alvin", email:"000@gmail.com"),
            Friend(username: "Jane", email:"111@gmail.com"),
            Friend(username: "Lewis", email:"222@gmail.com"),
            Friend(username: "Pudding", email:"333@gmail.com"),
            Friend(username: "Bob", email:"444@gmail.com"),
            Friend(username: "Ash", email:"555@gmail.com"),
            
        ]
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    

}


extension FriendsViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != ""
        {
            return filterFriends.count
        }
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendSearchTableViewCell
        let friend: Friend
        if searchController.isActive && searchController.searchBar.text != ""
        {
            friend = filterFriends[indexPath.row]
        }
        else
        {
            friend = friends[indexPath.row]
        }
        
        cell.usernameLabel.text = friend.username
        cell.emailLabel.text = friend.email
        return cell
    }
    
    func filterContentForSearchText(searchText: String)
    {
        filterFriends = friends.filter { friend in
            return friend.username.lowercased().contains(searchText.lowercased())
        }
        self.friendsTableView.reloadData()
    }
}



extension FriendsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar)
    {
        filterContentForSearchText(searchText: searchBar.text!)
    }
}

extension FriendsViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
