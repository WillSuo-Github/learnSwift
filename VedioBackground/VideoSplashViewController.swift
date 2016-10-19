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
            
            setMoviePlayer(url: contentUrl)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(VideoSplashViewController.playerItemDidReachEnd),
        name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
        object: moviePlayer.player?.currentItem)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        moviePlayer.view.frame = view.bounds
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    private func setMoviePlayer(url: NSURL) {
        self.moviePlayer.player = AVPlayer(url: url as URL)
        self.moviePlayer.player?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playerItemDidReachEnd() {
        
        moviePlayer.player?.seek(to: kCMTimeZero)
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
