//
//  StockPickingStateMachineViewController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/13.
//

import UIKit
import GameplayKit

public class StockPickingStateMachineViewController: UIViewController, MainTabBarPage {
    
    var stateMachine: GKStateMachine?
   
    public override func viewDidLoad() {
        super.viewDidLoad()
        // 狀態機初始化之後就不能增減狀態了，所以要在這邊把全部的狀態建構好再拿來建構狀態機。
        stateMachine = GKStateMachine(states: [
            StockPickingSegmentState(viewController: self),
            StockPickingMainState(viewController: self)
        ])
        // 要狀態機先進入多方選股狀態。
        stateMachine?.enter(StockPickingSegmentState.self)
    }

}
