//
//  RegisterViewController.swift
//  PanMusic
//
//  Created by lizhifm on 2022/6/29.
//  Copyright © 2022 lizhifm. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true){() -> Void in
            var dataDict = [String:String]()
            dataDict["username"] = self.txtUsername.text
            dataDict["password"] = self.txtPassword.text
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: dataDict)
        }
    }
    

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: {print("关闭模糊时图")})
    }
}
