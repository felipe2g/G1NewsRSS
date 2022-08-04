//
//  NewsAdapter.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import Foundation

struct NewsAdapter {
    //TODO: CHANGE THIS ADAPTER ONLY FOR NEW ITEM, NOT FOR NEWS LIST
    
    let title: String
    let link: String
    let description: String?
    let urlImage: String
    
    init(title: String, link: String, description: String, urlImage: String) {
        self.title = title
        self.link = link
        self.description = description
        self.urlImage = urlImage
    }
}
