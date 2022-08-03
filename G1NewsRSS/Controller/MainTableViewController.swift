//
//  MainTableViewController.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var news: [String] = ["Noticias", "Teste", "teste"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.prepare(newsTitle: news[indexPath.row])
        
        return cell
    }
}
