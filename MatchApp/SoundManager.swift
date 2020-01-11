//
//  SoundManager.swift
//  MatchApp
//
//  Created by KYT on 2020/1/11.
//  Copyright © 2020 tgnco1218. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    static func playSound(_ effect:SoundEffect) {
        
        // Determine which sound effect we want to play
        // And set the appropriate filename
        var soundFilename = ""
        
        switch effect {
            
        case .flip:
            soundFilename = "cardflip"
            
        case .shuffle:
            soundFilename = "shuffle"
            
        case .match:
            soundFilename = "dingcorrect"
            
        case . nomatch:
            soundFilename = "dingwrong"
            
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find the sound filename in the bundle!")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        }
            
        catch{
            
            // Couldn't create the audio player object, log the error
            print("Couldn't create the audio player object for the sound file \(soundFilename).")
        }
    }
}

