//
//  RadioPlayer.swift
//  sulamericaparadiso
//
//  Created by Juan Beleño Díaz on 19/10/16.
//  Copyright © 2016 Juan Beleño Díaz. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    private var player = AVPlayer(url: URL(string: "http://evp.mm.uol.com.br/dial-sulamerica/_definst_//dial-sulamerica.sdp/playlist.m3u8")!)
    private var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func volume(volume: Float) {
        player.volume = volume
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
}
