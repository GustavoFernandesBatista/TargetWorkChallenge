//
//  InfosUIViewController.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 05/08/22.
//

import UIKit
import FeedKit
import Kingfisher

class InfosUIViewController: UIViewController {
    
    @IBOutlet weak var imageUIView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    
    var feeds: RSSFeedItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let feeds = feeds{
            self.titleLabel.text = feeds.title
            self.subtitleLabel.text = formateString(string: feeds.description ?? "")
            guard let url = feeds.media?.mediaContents?.first?.attributes?.url else{return}
            let imageURL = URL(string: url)
            self.imageUIView.kf.setImage(with: imageURL)
            self.backGroundView.addSombra()
        }
    }
    
    func formateString(string:String)-> String{
        let str = string.replacingOccurrences(of: "(<[^>]+>)", with: "", options: .regularExpression, range: nil)
        return str
    }
}



