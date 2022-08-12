//
//  FeedTableViewCell.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//
import UIKit
import FeedKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var imagemView: UIImageView!
    
    
    // MARK: - INICIALIZADOR
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func setup(title: String, description: String, image: String) {
        self.backGroundView.addSombra()
        self.titleLabel.text = title
        self.descriptionLabel.text = formateString(string: description)
        let imageURL = URL(string: image)
        self.imagemView.kf.setImage(with: imageURL)
    }
    func formateString(string:String)-> String {
        let str = string.replacingOccurrences(of: "(<[^>]+>)", with: "", options: .regularExpression, range: nil)
        return str
    }
}
