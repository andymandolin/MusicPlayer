//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/1/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let user = User.shared
    let player = Player.shared
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var playlistTableView: UITableView!
    
    var isFirstLoad = true
    
    //MARK:- TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.playlist.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath) as! PlaylistCell
       //Get images using SDWebImage to handle sync/async
        cell.albumImageView.sd_setImage(with: URL(string: user.playlist[indexPath.row].imageName), placeholderImage: UIImage(named: "placeholder.png"))
        
        cell.songNameLbl.text = user.playlist[indexPath.row].name
        cell.artistLbl.text = user.playlist[indexPath.row].artistName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        player.currentSong = indexPath.row
        player.playback()
        
        containerView.fadeIn() //Show ContainerView when user selects a song
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 80))
            let label = UILabel(frame: CGRect(x: 30, y: 20, width: tableView.frame.size.width, height: 40))
                label.font = UIFont.systemFont(ofSize: 30)
                label.textColor = UIColor.white
                label.text = "Made For You"
            headerView.addSubview(label)
        
            headerView.backgroundColor = UIColor.clear
        
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 80
        }
    
    //Hide ContainerView on first screen load
    func containerViewRevealState() {
        if isFirstLoad == true {
            containerView.isHidden = true
        } else {
            containerView.isHidden = false
        }
        
    }

    override func viewDidLoad() {
        player.notifySongState()

        containerViewRevealState() //Setup ContainerView reveal
        
        let height: CGFloat = topView.bounds.size.height //Setup TableView reveal
        self.playlistTableView.contentInset =  UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)

        super.viewDidLoad()
    }
}


extension UIView {
    //MARK:- ContainerView reveal methods
    func fadeIn(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        
        if isHidden == true {
            self.alpha = 0
            self.isHidden = false
            UIView.animate(withDuration: duration!,
                       animations: { self.alpha = 1 },
                       completion: { (value: Bool) in
                          if let complete = onCompletion { complete() }
                       }
        )
        } else {
            return
        }
    }


}
