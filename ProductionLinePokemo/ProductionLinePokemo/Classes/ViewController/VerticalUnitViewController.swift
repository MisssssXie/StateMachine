//
//  VerticalUnitViewController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/12.
//

import UIKit

/// 垂直單元模塊iewController，要裝進main的必須conform VerticalUnitViewControllerProtocol
class VerticalUnitViewController: UIViewController, VerticalUnitViewControllerProtocol {

    var height: CGFloat
    
    required init(height: CGFloat) {
        self.height = height
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let colors: [UIColor] = [.gray, .blue, .red, .yellow, .cyan].shuffled()
        
        self.view.backgroundColor = colors[0]
        
        // Do any additional setup after loading the view.
    }

}
