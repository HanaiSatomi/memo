//
//  ViewController.swift
//  MyMemo
//
//  Created by Satomi Hanai on 2019/07/02.
//  Copyright © 2019 Satomi Hanai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func inputView(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBAction func tapHozonButton(_ sender: Any) {
    }
    @IBAction func tapModoruButton(_ sender: Any) {
    }
    @IBAction func tapScreen(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}
