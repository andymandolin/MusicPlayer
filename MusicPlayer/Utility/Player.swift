//
//  Player.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/2/21.
//

import Foundation
import AVFoundation

class Player {
    
    static let shared = Player()
    
    let user = User.shared
    
    //Keeps track of current song
    var currentSong = 0 {
        didSet {
            notifySongState() //Update UI on all screens
        }
    }
    
    func notifySongState() {
        let songDataDict: [String: Song] = ["song": (user.playlist[currentSong])]
        NotificationCenter.default.post(name: Notification.Name("updateMediaPlayerUI"), object: nil, userInfo: songDataDict)
        
        let songStateDict:[String: Bool] = ["isPlaying": isPlaying]
        NotificationCenter.default.post(name: Notification.Name("updatePlayButtonUI"), object: nil, userInfo: songStateDict)
        
    }

    //Keeps track of playback state
    var isPlaying = false {
        didSet {
            notifySongState()
        }
    }
    
    var player : AVPlayer!

    
    //MARK:- Playback methods
    //Gets audio from URL and starts playback
    func playback() {
        let currentSongURL = user.playlist[currentSong].songURL
            guard let url = URL.init(string: currentSongURL) else {
            //TODO: show alert message here
            print("error")
            return }

        let playerItem = AVPlayerItem.init(url: url)
        player = AVPlayer.init(playerItem: playerItem)
        player?.play()
        
        isPlaying = true
        
        player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { [self] (CMTime) -> Void in
            if self.player!.currentItem?.status == .readyToPlay {
                
                let duration : CMTime = playerItem.asset.duration
                let playerDurationInSeconds = CMTimeGetSeconds(duration) //total seconds
                let readableDurationTime = self.stringFromTime(toCalc: playerDurationInSeconds) //total seconds in HH:MM:SS format
                
                let time : Float64 = CMTimeGetSeconds(self.player!.currentTime())
                let playerLocationInSeconds = self.stringFromTime(toCalc: time) //actual seconds

                //Create Time object for notification
                let songTime = Time(songElapsedTime: playerLocationInSeconds, songLocationByTime: Float(time), songDurationInTotalSeconds: playerDurationInSeconds, songDurationReadable: readableDurationTime)
                
                let songStateDict:[String: Time] = ["songTime": songTime]
                NotificationCenter.default.post(name: Notification.Name("updateSlider"), object: nil, userInfo: songStateDict)
            }
        }
    }
    
    //MARK:- Current song and state methods
    func getCurrentSong() -> Song {
        let userCurrentSong = user.playlist[currentSong]
        return userCurrentSong
    }
    
    func getPlaybackState() -> Bool {
        if isPlaying == false {
            return false
        } else {
            return true
        }
    }

    //MARK:- Utility methods
    func stringFromTime(toCalc: TimeInterval) -> String {
        
        let interval = Int(toCalc)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    //MARK:- Playback methods
    //Restarts first song or jumps to the previous song based on current song playing
    func backSong() {
        if currentSong == 0 {
            player.seek(to: .zero)
            playback()
            
        } else {
            currentSong += 1
            playback()
        }
        notifySongState()
    }
    
    //Advances to next song or jumps to the first song based on current song playing
    func forwardSong() {
        if currentSong == user.playlist.count-1 {
            currentSong = 0
            playback()
        } else {
            currentSong += 1
            playback()
        }
        notifySongState()
    }
    
    //Simple start/pause of playback and updates the play button globally
    func startOrPausePlayback() {
        if isPlaying == false {
            playback()
        } else {
            player?.pause()
            isPlaying = false
        }
        notifySongState()
    }
}


