//
//  ProfilePageViewController.swift
//  GiveMeRide
//
//  Created by Uthej Mopathi on 10/7/20.
//  Copyright © 2020 Uthej Mopathi. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {
  
    let availableProfileSections = ["First Name","Last Name", "Email", "Mobile", "Gender" ]
    let profileDetails = ["Uthej","Mopathi", "mopathiTazMo@gmail.com", "9174329553", "Male" ]
    
    @IBOutlet weak var ProfileDP: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.visibleViewController!.title = "My Info"
        // Do any additional setup after loading the view.
    }
}

extension ProfilePageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePageCell", for: indexPath) as? ProfilePageTableViewCell
        cell?.sectionName.text = availableProfileSections[indexPath.row]
        cell?.sectionDetaisl.text = profileDetails[indexPath.row]
        print("Data is \(availableProfileSections[indexPath.row])")
        return cell!
    }    
}

class ProfilePageTableViewCell: UITableViewCell{
    static let identifier = "ProfilePageCell"
    @IBOutlet weak var sectionName: UILabel!
    @IBOutlet weak var sectionDetaisl: UILabel!
}
