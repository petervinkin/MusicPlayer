//
//  PlayerViewController.swift
//  PanMusic
//
//  Created by lizhifm on 2022/6/29.
//  Copyright © 2022 lizhifm. All rights reserved.
//

import UIKit
import AVFoundation


class PlayerViewController: UIViewController,AVAudioPlayerDelegate {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var btnplay: UIButton!
    var songName: String!
    
    var player:AVAudioPlayer!
    
    let pause = UIImage(named: "pause")
    let play = UIImage(named: "play")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "播放停止"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func play(_ sender: Any) {
        if self.player == nil{
            let path = Bundle.main.path(forResource: songName, ofType: "mp3")
            //print(path)
            let url = URL(fileURLWithPath: path!)
            //print(url)
            do{
                self.player = try AVAudioPlayer(contentsOf: url)
            }catch let error as NSError{
                self.player = nil
                print(error.description)
                self.label.text = "播放错误"
                return
            }
            self.player.prepareToPlay()
            self.player.numberOfLoops = -1
            
            player.delegate = self
        }
        
        if !self.player.isPlaying{
            player.play()
            self.label.text = "正在播放： " + songName
            self.btnplay.setImage(pause, for: UIControl.State())
        }else{
            player.pause()
            self.label.text = "播放暂停"
            self.btnplay.setImage(play, for: UIControl.State())
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        if self.player != nil{
            self.player.stop()
            self.player.delegate = nil
            self.player = nil
            self.label.text = "播放停止"
            self.btnplay.setImage(play, for: UIControl.State())
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.label.text = "播放完成"
        self.btnplay.setImage(play, for: UIControl.State())
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        self.label.text = "播放错误"
        self.btnplay.setImage(play, for: UIControl.State())
    }
    
}
