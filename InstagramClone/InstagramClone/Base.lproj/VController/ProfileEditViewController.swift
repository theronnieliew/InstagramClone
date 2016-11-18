//
//  ProfileEditViewController.swift
//  InstagramClone
//
//  Created by Students on 11/15/16.
//  Copyright © 2016 Panda^4. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {
    @IBOutlet weak var editProfileImage: UIImageView!
    @IBOutlet weak var editUsernameText: UITextField!
    @IBOutlet weak var editEmailText: UITextField!
    @IBOutlet weak var editPasswordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func editDoneButton(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
