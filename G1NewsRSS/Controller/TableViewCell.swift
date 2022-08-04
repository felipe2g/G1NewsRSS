//
//  TableViewCell.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var newsItemDescription: UILabel!
    @IBOutlet weak var imageNewsItem: UIImageView!
    
    func prepare(with newsItem: NewsAdapter) {
        title.text = newsItem.title
        
        if let description = newsItem.description {
            let matched = matches(for: "<[^>]*>", in: description)
            var substring: String = description
            
            for ocurrence in matched {
                substring = substring.replacingOccurrences(of: ocurrence, with: "")
            }
            
            let normalized = substring.trimmingCharacters(in: .whitespacesAndNewlines)
            newsItemDescription.text = normalized
        }
        
        guard let url = URL(string: newsItem.urlImage) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                self.imageNewsItem.image = UIImage(data: data)
            }
        }.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func matches(for regex: String, in text: String) -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
