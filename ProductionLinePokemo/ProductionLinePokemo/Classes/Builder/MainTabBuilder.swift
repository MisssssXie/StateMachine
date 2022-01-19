//
//  MainTabBuilder.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

public class MainTabBarBuilder {
    
    private(set) var vcList: [UIViewController] = []
    
    func addVC(_ viewController: PokemoMainViewController) -> Self {
        let nav = UINavigationController(rootViewController: viewController)
        vcList.append(nav)
        return self
    }
    
    /// 取得VC的標題
    func getTitleList() -> [String] {
        var titleList: [String] = []
        for vc in vcList {
            titleList.append(NSLocalizedString(vc.title ?? "", comment: ""))
        }
        return titleList
    }
    
    func getVC() -> [UIViewController] {
        return vcList
    }
}
