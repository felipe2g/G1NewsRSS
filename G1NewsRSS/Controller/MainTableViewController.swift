//
//  MainTableViewController.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var news: [NewsAdapter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getNewsFromApi { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let response):
                    for item in response {
                        if let imageURL = item.mediaContent?.url {
                            let data = NewsAdapter(title: item.title, link: item.link, description: item.description, urlImage: imageURL, itemUrl: item.link)
                            self.news.append(data)
                        }
                    }
                // Is important reload UI with main thread, to prevent lag on application
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    //self.hideActivityIndicator()
                }
                case .failure(let error):
                    print("error: \(error)")
                    //self.hideActivityIndicator()
                }
            }
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.prepare(with: news[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let url = URL(string: news[indexPath.row].itemUrl) {
                UIApplication.shared.open(url)
            }
        }
}
