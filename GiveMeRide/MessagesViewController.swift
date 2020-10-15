//
//  MessagesViewController.swift
//  GiveMeRide
//
//  Created by Uthej Mopathi on 10/7/20.
//  Copyright © 2020 Uthej Mopathi. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.visibleViewController!.title = "Inbox"

        // Do any additional setup after loading the view.
    }
}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesTableCell", for: indexPath) as? MessagesTableCell
        cell?.messagesLabel.text = "My Name is Here"
        return cell!
    }
    
    
}

class MessagesTableCell: UITableViewCell{
    static let identifier = "MessagesTableCell"
    @IBOutlet weak var messagesDP: UIImageView!
    @IBOutlet weak var messagesLabel: UILabel!
}
