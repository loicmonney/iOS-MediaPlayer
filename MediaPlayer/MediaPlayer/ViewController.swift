//
//  ViewController.swift
//  MediaPlayer
//
//  Created by Loïc Monney on 18/12/15.
//  Copyright © 2015 Loïc Monney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var leftSwipe : UISwipeGestureRecognizer? = nil
    var rightSwipe : UISwipeGestureRecognizer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add swipe recognizer
        leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe!.direction = .Left
        rightSwipe!.direction = .Right
        view.addGestureRecognizer(leftSwipe!)
        view.addGestureRecognizer(rightSwipe!)
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            performSegueWithIdentifier("playVideoSegue", sender: self)
        }
        else if (sender.direction == .Right) {
            performSegueWithIdentifier("playMusicSegue", sender: self)
        }
    }
}

