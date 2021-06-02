//
//  ListController.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 02/06/21.
//

import Foundation
import UIKit

class ListController<T>: UIViewController, UITableViewDelegate , UITableViewDataSource{
    var list: [T]? = []
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        let simpleCell = UINib(nibName: "SimpleCell", bundle: nil)
        tableView.register(simpleCell, forCellReuseIdentifier: "cell");
        tableView.tableFooterView = UIView.init()
        self.tableView = tableView
        self.view.addSubview(tableView)
        self.reload()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SimpleCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SimpleCell
        let item = self.list![indexPath.row]
        cell.title.text = self.retrieveItemText(item: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.list![indexPath.row]
        self.selectAction(item: item)
    }
    func reload(){
        self.list = self.retrieveItems()
        self.tableView?.reloadData()
    }
    func retrieveItems() -> [T]?{
        return nil
    }
    func retrieveItemText(item: T) -> String? {
        return nil
    }
    func selectAction(item: T){
        
    }
}

