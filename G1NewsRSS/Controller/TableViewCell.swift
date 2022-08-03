//
//  TableViewCell.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    func prepare(with newsItem: NewsAdapter) {
        title.text = newsItem.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
