//
//  VerticalMainViewControllerBuilder.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

/// 可垂直組合起多個單元VC的主controller
class VerticalMainViewController: UIViewController, MainTabBarPage {

    private var containerViewControllerOrder: [VerticalUnitViewControllerProtocol]

    
    init(title: String, containerViewControllerOrder: [VerticalUnitViewControllerProtocol]) {
        self.containerViewControllerOrder = containerViewControllerOrder
        super.init(nibName: nil, bundle: nil)
        self.title = title
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

// MARK: - UI Method

extension VerticalMainViewController {
    
    private func setupUI() {
        var theBeforeView: VerticalUnitViewControllerProtocol? = nil
        
        for containerViewController in containerViewControllerOrder {
            addChild(containerViewController)
            containerViewController.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(containerViewController.view)
            if let theBeforeView = theBeforeView {
                containerViewController.view.topAnchor.constraint(equalTo: theBeforeView.view.bottomAnchor).isActive = true
            } else {
                containerViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            }
            containerViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            containerViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            containerViewController.view.heightAnchor.constraint(equalToConstant: containerViewController.height).isActive = true
            
            theBeforeView = containerViewController
        }
    }
    
}
