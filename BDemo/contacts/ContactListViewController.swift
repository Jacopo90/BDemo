//
//  ContactListViewController.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 30/05/21.
//

import Foundation
import UIKit
import ContactsUI

class ContactListViewController: UIViewController {
    var allContacts: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        let sampleContactCell = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(sampleContactCell, forCellReuseIdentifier: "cell");
        tableView.tableFooterView = UIView.init()
        self.view.addSubview(tableView)
        self.allContacts = ContactsDataManager.shared.fetchContacts()
    }
}
extension ContactListViewController: UITableViewDelegate{
    
}
extension ContactListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allContacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactCell
        let contact = self.allContacts[indexPath.row]
        cell.title.text = contact.givenName + " " +  contact.familyName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
