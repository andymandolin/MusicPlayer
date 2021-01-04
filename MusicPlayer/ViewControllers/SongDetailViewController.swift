//
//  SongDetailViewController.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/2/21.
//

import UIKit
import SDWebImage

class SongDetailViewController: UIViewController {
    
    var player = Player.shared

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var progressBar: UISlider!
    @IBOutlet weak var playBackTimeLbl: UILabel!
    @IBOutlet weak var songDurationLbl: UILabel!

    //MARK:- Button methods
    @IBAction func closeBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var playBtn: UIButton!
    @IBAction func playBtn(_ sender: UIButton) {
        player.startOrPausePlayback()
    }
    @IBAction func backBtn(_ sender: UIButton) {
        player.backSong()
    }
    @IBAction func forwardBtn(_ sender: UIButton) {
        player.forwardSong()
    }
    
    var defaultImage = UIImage(named: "defaultUnsplash")
    
    //MARK:- UI updates
    @objc func updateMediaUI(notification: Notification) {
        if let dict = notification.userInfo as NSDictionary? {
                    if let passedSong = dict["song"] as? Song {
                        songNameLbl.text = passedSong.name
                        artistNameLbl.text = passedSong.artistName
                        artistImage!.sd_setImage(with: URL(string: passedSong.imageName), placeholderImage: defaultImage)
                    }
                }
       }
    
    @objc func updatePlayButtonUI(notification: Notification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let isPlaying = dict["isPlaying"] as? Bool{
                if isPlaying == false {
                    playBtn.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
                } else {
                    playBtn.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
                }
            }
        }
       }
    
    @objc func updateSlider(notification: Notification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let isPlaying = dict["songTime"] as? Time{
                progressBar.maximumValue = Float(isPlaying.songDurationInTotalSeconds)
                progressBar.value = isPlaying.songLocationByTime
                playBackTimeLbl.text = String(isPlaying.songElapsedTime)
                songDurationLbl.text = String(isPlaying.songDurationReadable)
                
            }
        }
       }
    
    //MARK:- Setup
    func setupSongInfo() {
        let localCurrentSong = player.getCurrentSong()
        artistImage!.sd_setImage(with: URL(string: localCurrentSong.imageName), placeholderImage: defaultImage)
        songNameLbl.text = localCurrentSong.name
        artistNameLbl.text = localCurrentSong.artistName

    }

    func setupPlaybackInfo() {
        let initialSongState = player.getPlaybackState()
        if initialSongState == false {
            playBtn.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        } else {
            playBtn.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSongInfo()
        setupPlaybackInfo()
        
        artistImage.contentMode = .scaleAspectFill
        artistImage.layer.cornerRadius = 6
        artistImage.layer.masksToBounds = true
        
        artistImage.layer.shadowColor = UIColor.black.cgColor
        artistImage.layer.shadowOffset = CGSize(width: 10.0, height: 10)
        artistImage.layer.shadowRadius = 7.0
        artistImage.layer.shadowOpacity = 0.4
        artistImage.layer.masksToBounds = false
        // Matching the contentView radius here will keep the shadow
        // in sync with the contentView's rounded shape
        artistImage.layer.cornerRadius = 79
        
        progressBar.tintColor = UIColor.black
        progressBar.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)


        NotificationCenter.default.addObserver(self, selector: #selector(self.updateMediaUI(notification:)), name: Notification.Name("updateMediaPlayerUI"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePlayButtonUI(notification:)), name: Notification.Name("updatePlayButtonUI"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateSlider(notification:)), name: Notification.Name("updateSlider"), object: nil)

    }

}
