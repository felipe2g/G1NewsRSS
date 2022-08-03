//
//  TableViewCell.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    func prepare(newsTitle: String) {
        title.text = newsTitle
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
