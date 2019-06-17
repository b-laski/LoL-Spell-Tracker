//
//  GenericViewController.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 17/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import UIKit
import SnapKit

class GenericViewController<View: GenericView>: UIViewController {
    public var contentView: View {
        return view as! View
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func loadView() {
        view = View()
    }
}
