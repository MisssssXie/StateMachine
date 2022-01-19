//
//  StockStateMachinViewController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/14.
//

import UIKit
import GameplayKit

class StockDetailStateMachinViewController: UIViewController, MainTabBarPage {
    
    var stateMachine: GKStateMachine?
    
    private var commKeyList: [String]
    
    init(list: [String]) {
        commKeyList = list
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // 狀態機初始化之後就不能增減狀態了，所以要在這邊把全部的狀態建構好再拿來建構狀態機。
        stateMachine = GKStateMachine(states: [
            StockSwitchViewControllerState(viewController: self),
            StockDetailMainViewControllerState(viewController: self),
            StockDetailViewControllerState(viewController: self)
        ])
        
        stateMachine?.state(forClass: StockDetailMainViewControllerState.self)?.commKeyList.send(commKeyList)
        
        // 要狀態機先進入狀態。
        stateMachine?.enter(StockDetailMainViewControllerState.self)
        
    }

}
