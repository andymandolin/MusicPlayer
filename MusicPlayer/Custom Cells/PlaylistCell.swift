//
//  CustomTableViewCell.swift
//  MusicPlayer
//
//  Created by Andy Geipel on 1/1/21.
//

import UIKit

class PlaylistCell: UITableViewCell {

    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    

    //Disable UI update when selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        albumImageView.layer.cornerRadius = 6
        albumImageView.layer.masksToBounds = true
    }

}
