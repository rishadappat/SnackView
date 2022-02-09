//
//  ViewController.swift
//  SnackviewExampple
//
//  Created by Rishad Appat on 09/02/2022.
//

import UIKit
import SnackView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SnackViewBulder().buildSuccess(withMessage: "Test")
    }
}

