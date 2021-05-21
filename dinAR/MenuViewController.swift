//
//  MenuViewController.swift
//  dinAR
//
//  Created by Aaryaman Saini on 15/05/21.
//

import UIKit

class MenuViewController: UITableViewController {
    
    
    let dishes = [
        "AppleStrudel",
        "Cake",
        "CerealBowl",
        "Hotdog",
        "LobsterTail",
        "Pizza",
        "SweetBun",
        "Tea"
    ]
    
    let menuItemColor =  UIColor(red:0.25, green:0.21, blue:0.14, alpha:1)

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(red:1.0, green:0.81, blue:0.85, alpha:1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        cell.textLabel?.text = dishes[indexPath.row]
        cell.textLabel?.textColor = menuItemColor
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController{
            vc.item = dishes[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }


}
