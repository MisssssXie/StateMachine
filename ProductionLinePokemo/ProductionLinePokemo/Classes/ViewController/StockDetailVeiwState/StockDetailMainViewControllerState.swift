//
//  StockState.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/14.
//

import GameplayKit
import Combine

class StockDetailMainViewControllerState: ViewControllerState {
    
    /// 現在索引值
    private var currentStockIndex: Int = 0
    
    /// ViewModel
    let commKeyList = CurrentValueSubject<[String], Never>([])
    
    private var commKeys: [String] = []
    
    private(set) var commKey: String = ""
    
    private var cancellable: AnyCancellable?

    public override func didEnter(from previousState: GKState?) {
     
        bindData()
        stateMachine?.enter(StockSwitchViewControllerState.self)
        
    }
    
    private func bindData() {
        cancellable = commKeyList
            .sink(receiveValue: { [weak self] value in
                guard let self = self else {return}
                print("value \(value)")
            
                self.commKeys = value
                guard self.commKeys.indices.contains(self.currentStockIndex) else {return}
                self.commKey = self.commKeys[self.currentStockIndex]
                self.stateMachine?.state(forClass: StockSwitchViewControllerState.self)?.titleObservable.send(self.commKey)
            }
        )
    }
    
    func didTapLeftButton() {
        if currentStockIndex - 1 < 0 { return }
        
        currentStockIndex -= 1
        
        // 將commKey 通知 變更
        commKey = commKeys[currentStockIndex]
        self.stateMachine?.state(forClass: StockSwitchViewControllerState.self)?.titleObservable.send(self.commKey)
        self.stateMachine?.state(forClass: StockDetailViewControllerState.self)?.commKey.send(commKey)
    }
    
    func didTapRightButton() {
        if currentStockIndex + 1 >= commKeys.count {
            return
        }
        
        currentStockIndex += 1
        
        // 將commKey 通知 變更
        commKey = commKeys[currentStockIndex]
        self.stateMachine?.state(forClass: StockSwitchViewControllerState.self)?.titleObservable.send(self.commKey)
        self.stateMachine?.state(forClass: StockDetailViewControllerState.self)?.commKey.send(commKey)
    }
    
}
