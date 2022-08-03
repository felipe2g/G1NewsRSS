//
//  News.swift
//  G1NewsRSS
//
//  Created by Felipe Guimarães on 03/08/22.
//

import Foundation

struct Rss: Codable {
    let channel: Channel
}

struct Channel: Codable {
    let title, link, description: String
    let item: [NewsItem]
}

struct NewsItem: Codable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
    let urlImage: String?
    let mediaContent: MediaContent?
    
    enum CodingKeys: String, CodingKey {
        case title, link, description, pubDate, urlImage
        case mediaContent = "media:content"
    }
}

struct MediaContent: Codable {
    let url: String
}
