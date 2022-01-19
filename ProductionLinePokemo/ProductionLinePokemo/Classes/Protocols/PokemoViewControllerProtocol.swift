//
//  VerticalUnitViewController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

protocol VerticalUnitViewControllerProtocol where Self: UIViewController {
    var height: CGFloat { get }
    
    init(height: CGFloat)
}
