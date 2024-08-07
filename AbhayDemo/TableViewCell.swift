//
//  TableViewCell.swift
//  AbhayDemo
//
//  Created by singsys on 14/06/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var idlbltext: UILabel!
    
    @IBOutlet weak var titlelbltext: UILabel!
    
    @IBOutlet weak var bodylbltext: UILabel!
    
    
    @IBOutlet weak var useridlbl: UILabel!
    
    
    @IBOutlet weak var apiimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
