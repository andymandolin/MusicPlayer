//
//  MediaPlayerViewController.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/2/21.
//

import UIKit

class MediaPlayerViewController: UIViewController {
    
    let player = Player.shared

    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    //MARK:- Button methods
    @IBAction func playBtn(_ sender: UIButton) {
        player.startOrPausePlayback()
    }
    
    //MARK:- UI updates
    @objc func updateMediaUI(notification: Notification) {
        if let dict = notification.userInfo as NSDictionary? {
                    if let passedSong = dict["song"] as? Song {
                        songNameLbl.text = passedSong.name
                        artistNameLbl.text = passedSong.artistName
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
    
    //MARK:- Instantiate ViewController from GestureRecognizer
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let popVC = self.storyboard?.instantiateViewController(withIdentifier: "SongDetailViewController") as? SongDetailViewController else { return }
           popVC.modalPresentationStyle = .popover
           popVC.preferredContentSize = CGSize(width: 250, height: 250)
           self.present(popVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.notifySongState() //Get initial song state
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        backgroundView.addGestureRecognizer(tap)

        NotificationCenter.default.addObserver(self, selector: #selector(self.updateMediaUI(notification:)), name: Notification.Name("updateMediaPlayerUI"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePlayButtonUI(notification:)), name: Notification.Name("updatePlayButtonUI"), object: nil)

    }

}
