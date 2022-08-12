//
//  HeaderViewController.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//

import UIKit

class HeaderViewController: UIView {
    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var imagemView: UIImageView!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("HeaderViewController", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
    }
}
