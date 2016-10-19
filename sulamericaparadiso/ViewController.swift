//
//  ViewController.swift
//  sulamericaparadiso
//
// This project was based on the project https://github.com/luciancancescu/sample-radio-app
//
//  Created by Juan Beleño Díaz on 18/10/16.
//  Copyright © 2016 Juan Beleño Díaz. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    //MARK: - Actions
    
    @IBAction func pause_stream(_ sender: AnyObject) {
        RadioPlayer.sharedInstance.pause()
        btnPlay.setImage(UIImage(named:"btn-play"), for: UIControlState.normal)
        btnPause.setImage(UIImage(named:"btn-pause-disabled"), for: UIControlState.normal)
    }
    
    @IBAction func play_stream(_ sender: AnyObject) {
        RadioPlayer.sharedInstance.play()
        btnPlay.setImage(UIImage(named:"btn-play-disabled"), for: UIControlState.normal)
        btnPause.setImage(UIImage(named:"btn-pause"), for: UIControlState.normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start the music by default
        RadioPlayer.sharedInstance.play()
        
        
        // Handle music in background
        if NSClassFromString("MPNowPlayingInfoCenter") != nil {
            let image:UIImage = UIImage(named: "little-icon")!
            let albumArt = MPMediaItemArtwork(image: image)
            let songInfo = [
                MPMediaItemPropertyTitle: "Rádio Sulamérica Paradiso",
                MPMediaItemPropertyArtist: "FM - 95,7",
                MPMediaItemPropertyArtwork: albumArt
            ] as [String : Any]
            MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            UIApplication.shared.beginReceivingRemoteControlEvents()
            print("Receiving remote control events\n")
        } catch {
            print("Audio Session error.\n")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Preferred status bar style lightContent to use on dark background.
    // Swift 3
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

