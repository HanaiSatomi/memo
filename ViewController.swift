//
//  ViewController.swift
//  MyMemo
//
//  Created by Satomi Hanai on 2019/07/02.
//  Copyright © 2019 Satomi Hanai. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    var memoItems: Results<Mymemo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let realm = try! Realm()
        memoItems = realm.objects(Mymemo.self)
        tableView?.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Customcell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
    }
    
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem){
    }
    
    @IBAction func tappSaveButton(_ sender: Any) {
        let mymemo = Mymemo()
        if let title:String = textField.text, let detail = textView.text {
            mymemo.title = title
            mymemo.details = detail
        }
        mymemo.title = textField.text!
        mymemo.details = textView.text
        mymemo.created_at = Date()
        let realm = try! Realm()
        try! realm.write() {
            realm.add (mymemo)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tappReturnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapScreen(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    // MARK: UITableViewDetasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return memoItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as! CustomCell
        let memoItem = memoItems[indexPath.row]
        let customDateFomatter = CustomDateFomatter()
        let dateString = customDateFomatter.getDateString(date: memoItem.created_at)
        cell.dateLabel?.text = dateString
        cell.titleLabel?.text = memoItem.title
        return cell
    }
}
