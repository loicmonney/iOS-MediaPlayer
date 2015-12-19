//
//  PlayMusicViewController.swift
//  iOSMediaPlayer
//
//  Created by Loïc Monney on 18/12/15.
//  Copyright © 2015 Loïc Monney. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class PlayMusicViewController: UITableViewController {
    
    var songs : [MPMediaItem]? = nil
    let player = MPMusicPlayerController.applicationMusicPlayer()
    
    override func viewDidLoad() {
        reloadSongs();
        player.setQueueWithQuery(MPMediaQuery())
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        player.nowPlayingItem = songs![indexPath.row]
        player.play()
        return indexPath;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell", forIndexPath: indexPath) as UITableViewCell
        
        let song : MPMediaItem = songs![indexPath.row]
        cell.textLabel?.text = song.title
        cell.imageView?.image = song.artwork?.imageWithSize(CGSize(width: 75, height: 75))
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs!.count
    }
    
    func reloadSongs() {
        let query = MPMediaQuery()
        songs = query.items
    }
}