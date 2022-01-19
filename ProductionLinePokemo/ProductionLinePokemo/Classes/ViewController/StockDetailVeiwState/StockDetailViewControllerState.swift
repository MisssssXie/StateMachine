//
//  StockDetailViewControllerState.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/14.
//

import GameplayKit
import Combine

class StockDetailViewControllerState: ViewControllerState {
    
    let commKey = CurrentValueSubject<String, Never>("無資料")
    private var cancellable: AnyCancellable?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    public override func didEnter(from previousState: GKState?) {
        
        bindData()
        
        view.addSubview(label)
        view.backgroundColor = .brown
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
    
    private func bindData() {
        cancellable = commKey.sink(
        receiveCompletion: { complete in

        },
        receiveValue: { value in
         
            self.label.text = value
            print("value \(value)")
   
          }
        )
    }
    
    // 在離開狀態之前，把 label 從 View 階層移除。
    public override func willExit(to nextState: GKState) {
        label.removeFromSuperview()
    }
}
