//
//  MainTabBarController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/12.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let tabBarInfos: [ButtonInfoProtocol]
    private let viewController: [UIViewController]
    private var style: MainTabBarStyle = MainTabBarStyle()
    
    init(vcList: [UIViewController], info: [ButtonInfoProtocol], style: MainTabBarStyle = MainTabBarStyle()) {
        tabBarInfos = info
        viewController = vcList
        super.init(nibName: nil, bundle: nil)
        setupNavigationStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = viewController
        setupUI()
        setupBarItems()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)

    }
    
    // MARK: - ui methods
    private func setupUI() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .blue
    }

    private func setupBarItems() {
        
        /// Tab bar 文字設定
        
        let count = tabBarInfos.count
        
        for i in 0..<count {
            
            if tabBarInfos.indices.contains(i),
               let items = self.tabBar.items,
               items.indices.contains(i) {
                let title = tabBarInfos[i].title
                let normaiIcon = tabBarInfos[i].normalIcon
                let selectedIcon = tabBarInfos[i].selectedIcon
                items[i].title = title
                items[i].image = normaiIcon
                items[i].selectedImage = selectedIcon
            }
        }
        setTabbarTitleColor()
    }
    
    private func setTabbarTitleColor() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: style.tabbarTitleSelected], for: .selected)
    }
    
    private func setupNavigationStyle() {
        UINavigationBar.appearance().barTintColor = style.mainNavigationBackground
        UINavigationBar.appearance().tintColor = style.tintColor
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: style.titleTextColor,
            .font: style.titleTextFont
        ]
//        
//        let barAppearance =  UINavigationBarAppearance()
//        barAppearance.configureWithDefaultBackground()
//        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }

}

// MARK: - Custom Method

extension MainTabBarController {
    
    func getSelectedNavigationController() -> UINavigationController? {
        
        let index = self.selectedIndex
        
        if let viewControllers = viewControllers,
           viewControllers.indices.contains(index),
           let nav = viewControllers[index] as? UINavigationController {
            return nav
        }
        
        return nil
    }

}
