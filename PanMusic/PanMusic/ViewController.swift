//
//  ViewController.swift
//  PanMusic
//
//  Created by lizhifm on 2022/6/29.
//  Copyright © 2022 lizhifm. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    var u:String!
    var p:String!
    
    @IBOutlet weak var us: UITextField!
    @IBOutlet weak var pw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(registerCompletion(_notification:)), name: Notification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
        self.pw.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func registerCompletion(_notification: Notification){
        let theData = _notification.userInfo as! [String:String]
        let username = theData["username"]!
        let password = theData["password"]!
        u = username
        p = password
    }

    @IBAction func Login(_ sender: Any) {
        if(self.us.text == u && self.pw.text == p){
            self.performSegue(withIdentifier: "Login", sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pw.resignFirstResponder()
        return true
    }
}

