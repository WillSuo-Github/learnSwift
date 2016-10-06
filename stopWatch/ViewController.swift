//
//  ViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    var counter = 0.0
    var Timer : NSTimer!
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func resetBtnChick(sender: AnyObject) {
        Timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func startBtnChick(sender: AnyObject) {
        if isPlaying {
            return
        }
        isPlaying = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pauseBtnChick(sender: AnyObject) {
        
        isPlaying = false
        Timer.invalidate()
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

