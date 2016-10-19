//
//  ViewController.swift
//  RandomColorization
//
//  Created by ws on 2016/10/8.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var gradientLayer = CAGradientLayer()
    var timer: Timer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playBtnChick(_ sender: AnyObject) {
        
        
        do{
            
            let musicUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: musicUrl)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }catch let audioError as NSError{
            
            print(audioError)
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }
        
        
        //graditent color
  
    }
    
    func randomColor (){
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

}

