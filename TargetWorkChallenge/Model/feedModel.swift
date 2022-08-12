//
//  Feed.swift
//  Teste
//
//  Created by Giuliano Accorsi on 04/08/22.
//

import Foundation
import FeedKit

class FeedModel {
    let feedURL = URL(String: "HTTPS://g1.globo.com/rss/g1/carros/")
    let parser = FeedParser(URL: feedURL)
    
    init(feedUrl: String) {
        self.feedURL = feedUrl
    }
    
    func loadRSS() -> [RSSFeedItem] {
        guard let feedURL = URL(string: feedURL) else {return []}
        let parser = FeedParser(URL: feedURL)
        let result = parser.parse()
        switch result {
        case .success(let feed):
            return feed.rssFeed?.items
        case .failure(_):
            print("Deu ruim")
        }
    }
}
