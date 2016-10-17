//
//  ViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!

    
    @IBOutlet weak var timeLabel: UILabel!
    var counter = 0.0
    var timer : Timer!
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func resetBtnChick(_ sender: AnyObject) {
        
        if let time = timer {
            time.invalidate()
        }
        
        
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func startBtnChick(_ sender: AnyObject) {
        if isPlaying {
            return
        }
        isPlaying = true
//        Timer = Timer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pauseChick(_ sender: AnyObject) {
        isPlaying = false
        timer.invalidate()
    }
    
    
    func updateTime(){
        
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

