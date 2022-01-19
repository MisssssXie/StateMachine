//
//  ViewController.swift
//  DemoProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = MainTabBarBuilder()
        // 無互動關係可用
        let pokemoVC1 = VerticalMainViewControllerBuilder()
            .addTitle(title: "自選股頁")
            .addViewControllers([VerticalUnitViewController(height: 20),
                                 VerticalUnitViewController(height: 60),
                                 VerticalUnitViewController(height: 40)
                               ])
            .build()
        
        let mainTabVC = builder
            .addVC(
                pokemoVC1,
                IconInfo(
                    title: "自選股頁",
                    normalIcon: UIImage(systemName: "face.smiling"),
                    selectedIcon: UIImage(systemName: "bell")
                )
            )
            // 有互動關係使用StateMachine
            .addVC(
                MainStateMachineViewController(),
                IconInfo(
                    title: "狀態機1",
                    normalIcon: UIImage(systemName: "face.smiling"),
                    selectedIcon: UIImage(systemName: "bell")
            ))
        
            .addVC(
                StockPickingStateMachineViewController(),
                IconInfo(
                    title: "狀態機2",
                    normalIcon: UIImage(systemName: "face.smiling"),
                    selectedIcon: UIImage(systemName: "bell")
            ))
            .build()
        
        setupUI(vc: mainTabVC)
        
    }

    // MARK: - ui methods
    private func setupUI(vc: UIViewController) {

        addChild(vc)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vc.view)
        vc.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

