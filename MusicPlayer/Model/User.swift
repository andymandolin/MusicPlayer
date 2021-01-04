//
//  User.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/1/21.
//

import Foundation

struct User {

    static let shared = User()
    
    var name: String?
    var playlist = [
        
        //MARK:- Demo data
    Song(name: "Boiling Point", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:5ea04675-92e2-4eba-afc0-713333d5cdaa/1535421069.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:5ea04675-92e2-4eba-afc0-713333d5cdaa/1535421070.mp3", artistName: "Maffa Rico"),
        
        Song(name: "Forever", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:a37ebb4c-86bb-42cf-8aac-72fbed4b6456/1559917184.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:a37ebb4c-86bb-42cf-8aac-72fbed4b6456/1559917148.mp3", artistName: "SHY BEAST"),
        
    Song(name: "Playing Around", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:6b2d424b-f2fb-412c-a365-8ff7964f2af3/1566235140.jpg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:6b2d424b-f2fb-412c-a365-8ff7964f2af3/1566235108.mp3", artistName: "Dankrupt"),
        
    Song(name: "Counting Sheep", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:8fdc9b5d-e4b4-4de2-95ff-daddf47917d6/45521_i_1582297538.png?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:6b2d424b-f2fb-412c-a365-8ff7964f2af3/1566235108.mp3", artistName: "Twin Chameleon"),
        
    Song(name: "Alone in Brooklyn", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:1a9e5036-c4b6-48d1-8563-19ead6095d26/1536007740.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:1a9e5036-c4b6-48d1-8563-19ead6095d26/1536007741.mp3", artistName: "Nick Anderson and the Skinny Lovers"),
        
    Song(name: "Pick Up the Robot(Put the Robot Down)", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:bb94e661-9089-4805-be4b-8d5f80f4f928/1561056746.jpg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:bb94e661-9089-4805-be4b-8d5f80f4f928/1561060296.mp3", artistName: "BOOHER"),
        
    Song(name: "Livewire", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:aff9721a-a24c-450c-80aa-2eb3b0100042/1566322739.jpeg?d=200x200", songURL: "", artistName: "Cates Whie"),
        
    Song(name: "Champagne Happiness", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:71ded798-0acc-4505-a920-e3c6662d1332/1543601469.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:71ded798-0acc-4505-a920-e3c6662d1332/1543601470.mp3", artistName: "Will Pfrang & The Good Land Gang"),
        
    Song(name: "real friend best friend", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:7b53ff25-a9ba-4ca9-88f5-1e937e149312/1562852298.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:7b53ff25-a9ba-4ca9-88f5-1e937e149312/1562852136.mp3", artistName: "Brevin Kim"),
        
    Song(name: "The Get Down", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:773adeec-cca8-4e84-a725-96fe5cc347ec/1562010441.png?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:773adeec-cca8-4e84-a725-96fe5cc347ec/1562009646.mp3", artistName: "Cowboy Diplomacy"),
        
    Song(name: "To You:", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:d9be2633-ebc2-4ddc-b90a-46fc65f553f1/1557335050.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:d9be2633-ebc2-4ddc-b90a-46fc65f553f1/1557334975.mp3", artistName: "When the Sun Sets"),
        
        Song(name: "Boiling Point", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:5ea04675-92e2-4eba-afc0-713333d5cdaa/1535421069.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:5ea04675-92e2-4eba-afc0-713333d5cdaa/1535421070.mp3", artistName: "Maffa Rico"),
            
            Song(name: "Forever", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:a37ebb4c-86bb-42cf-8aac-72fbed4b6456/1559917184.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:a37ebb4c-86bb-42cf-8aac-72fbed4b6456/1559917148.mp3", artistName: "SHY BEAST"),
            
        Song(name: "Playing Around", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:6b2d424b-f2fb-412c-a365-8ff7964f2af3/1566235140.jpg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:6b2d424b-f2fb-412c-a365-8ff7964f2af3/1566235108.mp3", artistName: "Dankrupt"),
            
        Song(name: "Counting Sheep", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:8fdc9b5d-e4b4-4de2-95ff-daddf47917d6/45521_i_1582297538.png?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:6b2d424b-f2fb-412c-a365-8ff7964f2af3/1566235108.mp3", artistName: "Twin Chameleon"),
            
        Song(name: "Alone in Brooklyn", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:1a9e5036-c4b6-48d1-8563-19ead6095d26/1536007740.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:1a9e5036-c4b6-48d1-8563-19ead6095d26/1536007741.mp3", artistName: "Nick Anderson and the Skinny Lovers"),
            
        Song(name: "Pick Up the Robot(Put the Robot Down)", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:bb94e661-9089-4805-be4b-8d5f80f4f928/1561056746.jpg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:bb94e661-9089-4805-be4b-8d5f80f4f928/1561060296.mp3", artistName: "BOOHER"),
            
        Song(name: "Livewire", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:aff9721a-a24c-450c-80aa-2eb3b0100042/1566322739.jpeg?d=200x200", songURL: "", artistName: "Cates Whie"),
            
        Song(name: "Champagne Happiness", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:71ded798-0acc-4505-a920-e3c6662d1332/1543601469.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:71ded798-0acc-4505-a920-e3c6662d1332/1543601470.mp3", artistName: "Will Pfrang & The Good Land Gang"),
            
        Song(name: "real friend best friend", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:7b53ff25-a9ba-4ca9-88f5-1e937e149312/1562852298.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:7b53ff25-a9ba-4ca9-88f5-1e937e149312/1562852136.mp3", artistName: "Brevin Kim"),
            
        Song(name: "The Get Down", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:773adeec-cca8-4e84-a725-96fe5cc347ec/1562010441.png?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:773adeec-cca8-4e84-a725-96fe5cc347ec/1562009646.mp3", artistName: "Cowboy Diplomacy"),
            
        Song(name: "To You:", imageName: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:d9be2633-ebc2-4ddc-b90a-46fc65f553f1/1557335050.jpeg?d=200x200", songURL: "https://d3tnchxzc2totz.cloudfront.net/protected/us-west-2:d9be2633-ebc2-4ddc-b90a-46fc65f553f1/1557334975.mp3", artistName: "When the Sun Sets")
    
    ]

}
