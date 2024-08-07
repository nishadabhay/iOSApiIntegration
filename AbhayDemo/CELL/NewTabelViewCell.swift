//
//  NewTabelViewCell.swift
//  AbhayDemo
//
//  Created by singsys on 05/07/24.
//

import UIKit

class NewTabelViewCell: UITableViewCell {
    
    @IBOutlet weak var apiimage: UIImageView!
    
    
    @IBOutlet weak var idlbl: UILabel!
    

    @IBOutlet weak var albumidlbl: UILabel!
    
    @IBOutlet weak var titlelbl: UILabel!
    
    
    @IBOutlet weak var thumbnailUrl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
