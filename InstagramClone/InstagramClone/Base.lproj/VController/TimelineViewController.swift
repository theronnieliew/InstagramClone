import UIKit
import Firebase
import FirebaseDatabase

class TimelineViewController: UIViewController {
    
    var firebaseDatabase : FIRDatabaseReference!
    var instaArray : [Polaroid] = []
    var stringURL : [String] = []
    var profilePicURL : [String] = []
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseDatabase = FIRDatabase.database().reference()
        fetchImages()
    }
    
    //MARK : Internal Function
    private func fetchImages(){
        
        firebaseDatabase.child("users").observe(.childAdded, with: { (snapshot) in
            let newPic = Polaroid()
            guard let picDictionary = snapshot.value as? [String: AnyObject] else{
                return
            }
            print("Dictionary values :\n \(picDictionary.values)\n\n")
            
            //! Fill in custom cell details
            newPic.userName = picDictionary["username"] as? String
            
            newPic.profilePic = (picDictionary["profile-picture"] as? String)!
            self.profilePicURL.append(newPic.profilePic!)
            
            newPic.pictureURL = picDictionary["pictures"] as! [String : String]
            let tempArray = newPic.pictureURL
            for key in tempArray.values{
                self.stringURL.append(key)
            }
            
            self.instaArray.append(newPic)
            self.tableView.reloadData()
        })
    }
}



extension TimelineViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return instaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : TimelineViewCell = tableView.dequeueReusableCell(withIdentifier: "timelineTableCell", for : indexPath) as? TimelineViewCell else{
            
            return UITableViewCell()
        }
        
        let insta = instaArray[indexPath.row]
        
        cell.usernameButton.setTitle(insta.userName, for: .normal)
        cell.profileImageView.loadImageUsingCacheWithUrlString(profilePicURL[indexPath.row])
        if(stringURL[indexPath.row] != ""){
            cell.feedImageView.loadImageUsingCacheWithUrlString(stringURL[indexPath.row])
        }
        
        return cell
    }
}

extension TimelineViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.reloadData()
    }
}
