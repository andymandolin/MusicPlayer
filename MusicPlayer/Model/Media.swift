//
//  Media.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/2/21.
//

import Foundation


struct Playlist {
    
    var songs: [Song] = []
    
}

struct Song {

    var name: String
    var imageName: String
    var songURL: String
    var artistName: String
    
}

struct Time {
    
    var songElapsedTime: String
    var songLocationByTime: Float
    var songDurationInTotalSeconds: Double
    var songDurationReadable: String
    
}
