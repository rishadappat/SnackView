//
//  ViewController.swift
//  SnackviewExampple
//
//  Created by Rishad Appat on 09/02/2022.
//

import UIKit
import SnackView


class ViewController: UIViewController {
    
    lazy var builder = SnackViewBulder()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func testButtonClicked(_ sender: Any) {
        count += 1
        builder.buildSuccess(withMessage: "Test: \(count)")
    }
}

