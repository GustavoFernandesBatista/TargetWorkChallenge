//
//  infosUIViewController.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//

import UIKit
import FeedKit

class InfosUIViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var feeds: RSSFeedItem?
    
    class func instanciar(infos: RSSFeedItem)-> InfosUIViewController{
        let infosViewController = InfosUIViewController(nibName: "InfosUIViewController", bundle: nil)
        infosViewController.feeds = infos
        return infosViewController
    }
    
// MARK: - METRICS

// MARK: - PROPRIEDADES
    
        
    
// MARK: - UI

// MARK: - INICIALIZADOR
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfos(title: "\(String(describing: titleLabel))", description: "\(description)")
    }

// MARK: - METODOS PRIVADOS

    
// MARK: - SETUP VIEW

// MARK: - EXTENSOES
    func setupInfos(title: String, description: String) {
        
        titleLabel.text = feeds?.title
        descriptionLabel.text = feeds?.description
    }
}
