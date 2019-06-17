//
//  GenericView.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 17/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import UIKit
import SnapKit

class GenericView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    override func layoutSubviews() {
        self.setupConstraint()
    }
    
    public func configureView() {}
    
    public func setupConstraint() {}
}
