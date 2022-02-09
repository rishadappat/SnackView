//
//  ViewController.swift
//  SnackViewSample
//
//  Created by Rishad Appat on 18/05/2020.
//  Copyright © 2020 Appat. All rights reserved.
//

import UIKit
import SnackView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum Config: String, CaseIterable{
        case Default = "Default"
        case WithSubTitle = "With SubTitle"
        case Success = "Success"
        case Failed = "Failed"
        case WithIcon = "With Icon"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Config.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Config.allCases[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            Snack().buildSuccess(withMessage: "Success message")
            break
        case 1:
            Snack().buildSuccess(withMessage: "Success message")
            break
        case 2:
            Snack().buildSuccess(withMessage: "Success message")
            break
        case 3:
            Snack().buildSuccess(withMessage: "Success message")
            break
        case 4:
            Snack().buildSuccess(withMessage: "Success message")
            break
        default:
            print("")
        }
    }
}
