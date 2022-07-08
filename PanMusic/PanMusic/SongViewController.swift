//
//  SongViewController.swift
//  PanMusic
//
//  Created by lizhifm on 2022/6/29.
//  Copyright © 2022 lizhifm. All rights reserved.
//

import UIKit

class SongViewController: UITableViewController {

    //var dictData: [String:Any]!
    var listData: [Any]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let plistPath = Bundle.main.path(forResource: "Songs", ofType: "plist")
        let array = NSArray(contentsOfFile: plistPath!)
        //let dict = NSDictionary(contentsOfFile: plistPath!)
        self.listData = array as? [Any]
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell{
        let cellIdentifier = "Songs"
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let row = indexPath.row
        let rowDict = self.listData[row] as! [String:String]
        
        
        cell.textLabel?.text = rowDict["name"]
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PlaySong"){
            let playerViewController = segue.destination as! PlayerViewController
            let indexpath = self.tableView.indexPathForSelectedRow as IndexPath?
            let selectedIndex = indexpath!.row
            
            let dict = self.listData[selectedIndex] as! [String:String]
            
            playerViewController.songName = dict["name"]
            
        }
    }
}
