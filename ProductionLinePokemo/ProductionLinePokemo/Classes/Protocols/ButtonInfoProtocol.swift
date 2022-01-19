//
//  ButtonInfoProtocol.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/12.
//

import UIKit

protocol ButtonInfoProtocol {
    var title: String { get }
    var normalIcon: UIImage? { get }
    var selectedIcon: UIImage? { get }
}

struct IconInfo: ButtonInfoProtocol {
    let title: String
    let normalIcon: UIImage?
    let selectedIcon: UIImage?
}
