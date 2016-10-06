//
//  ViewController.swift
//  localVideo
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = [
        
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30"),
    ]
    
    var playView = AVPlayer()
    var playViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib.init(nibName: "WSCell", bundle: nil), forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func playBtnChick(sender: UIButton){
        
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        
        playView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playViewController.player = playView
        self.presentViewController(playViewController, animated: true) { 
            self.playViewController.player?.play()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! WSCell
        
        cell.videoScreenShort.image = UIImage(named: data[indexPath.row].image)
        cell.titleLabel.text = data[indexPath.row].title
        cell.sourceLabel.text = data[indexPath.row].source
        cell.playBtn.tag = indexPath.row
        cell.playBtn.addTarget(self, action: #selector(ViewController.playBtnChick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }


    lazy var tableView :UITableView = {
       
        let t = UITableView(frame: self.view.frame)
        t.backgroundColor = UIColor.redColor()
        return t
    }()
}



