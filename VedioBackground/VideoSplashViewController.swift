//
//  VideoSplashViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/11.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class VideoSplashViewController: UIViewController {

    var moviePlayer = AVPlayerViewController()
    public var contentUrl: NSURL = NSURL(){
        didSet{
            
            setMoviePlayer(contentUrl)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(VideoSplashViewController.playerItemDidReachEnd),
        name: AVPlayerItemDidPlayToEndTimeNotification,
        object: moviePlayer.player?.currentItem)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        moviePlayer.view.frame = view.bounds
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    private func setMoviePlayer(url: NSURL) {
        self.moviePlayer.player = AVPlayer(URL: url)
        self.moviePlayer.player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playerItemDidReachEnd() {
        
        moviePlayer.player?.seekToTime(kCMTimeZero)
        moviePlayer.player?.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
