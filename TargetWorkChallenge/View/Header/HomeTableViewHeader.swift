//
//  HomeTableViewHeader.swift
//  TargetWorkChallenge
//
//  Created by Gustavo Fernandes on 04/08/22.
//

import UIKit

class HomeTableViewHeader: UIView {

    @IBOutlet weak var imagemView: UIImageView!
    @IBOutlet weak var backGroundView: UIView!
    
    
    func configuraView() {
        
        backGroundView.layer.masksToBounds = true
        backGroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
    

    }



    

