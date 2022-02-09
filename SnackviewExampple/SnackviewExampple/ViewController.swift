//
//  ViewController.swift
//  SnackviewExampple
//
//  Created by Rishad Appat on 09/02/2022.
//

import UIKit
import SnackView


class ViewController: UIViewController {
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func testButtonClicked(_ sender: Any) {
        count += 1
        SnackViewBulder().buildInfo(withMessage: "New \n Test: \n\(count)")
    }
}

