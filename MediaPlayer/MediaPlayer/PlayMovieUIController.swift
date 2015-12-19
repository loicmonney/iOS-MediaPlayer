//
//  PlayMovieUIController.swift
//  MediaPlayer
//
//  Created by Loïc Monney on 18/12/15.
//  Copyright © 2015 Loïc Monney. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayMovieUIController : UIViewController {
    
    @IBAction func playMovieClicked(sender: UIButton) {
        let videoURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
        let player = AVPlayer(URL: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
}
