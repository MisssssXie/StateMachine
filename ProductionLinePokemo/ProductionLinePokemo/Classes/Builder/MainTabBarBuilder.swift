//
//  MainTabBuilder.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

public protocol MainTabBarPage where Self: UIViewController {}

public class MainTabBarBuilder {
    
    private var vcList: [UIViewController] = []
    private var tabBarInfos: [ButtonInfoProtocol] = []
    private var style: MainTabBarStyle = MainTabBarStyle()
    
    func addVC(_ viewController: MainTabBarPage, _ iconInfo: ButtonInfoProtocol) -> Self {
        let nav = UINavigationController(rootViewController: viewController)
        vcList.append(nav)
        tabBarInfos.append(iconInfo)
        return self
    }
    
    func addStyle(_ style: MainTabBarStyle) -> Self {
        self.style = style
        return self
    }
    
    func build() -> MainTabBarController {
        return MainTabBarController(vcList: vcList, info: tabBarInfos, style: style)
    }
    
    
}
