//
//  SummonerSelectView.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 17/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import UIKit

class SummonerSelectView: GenericView {
    let summonerTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    override func configureView() {
        
    }
    
    override func setupConstraint() {
        addSubview(summonerTextField)
        
    }
}
