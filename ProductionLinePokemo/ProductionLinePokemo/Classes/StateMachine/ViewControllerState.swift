//
//  ViewControllerState.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit
import GameplayKit

public class ViewControllerState: GKState {
    // 用 unowned let 來防止循環持有。
    // unowned所修飾的 property永遠不為 nil ，若將此 property 設為 nil 程式會編譯錯誤。
    unowned let viewController: UIViewController
    // 用來存取 viewController.view 的捷徑。
   
    var view: UIView {
        viewController.view
    }
    
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
