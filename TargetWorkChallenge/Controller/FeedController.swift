//
//  FeedController.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//

import Foundation
import FeedKit

class FeedController {
    let feedURL: String
    init(feedUrl: String){
        self.feedURL = feedUrl
    }
    
    func loadRSS() -> [RSSFeedItem] {
        guard let feedURL = URL(string: feedURL) else {return []}
        let parser = FeedParser(URL: feedURL)
        let result = parser.parse()
        switch result {
        case .success(let feed):
            guard let rss = feed.rssFeed?.items else {return []}
            return rss
            
        case .failure(_):
            break
        }
        return []
    }
    
    func getCount() -> Int {
        return loadRSS().count
    }
}
