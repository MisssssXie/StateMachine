//
//  MainStateMachineViewController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit
import GameplayKit
import Combine

protocol StateMachineStrategy {
    var viewController: UIViewController { get }
    var stateMachine: GKStateMachine? { get }
    func enter()
}

class TestMainStrategy: StateMachineStrategy {
    
    var viewController: UIViewController
    
    var stateMachine: GKStateMachine?

    init(states: [ViewControllerState]) {
        self.viewController = states[0].viewController
        // 狀態機初始化之後就不能增減狀態了，所以要在這邊把全部的狀態建構好再拿來建構狀態機。
        stateMachine = GKStateMachine(states: states)
    }

    func enter() {
        stateMachine?.enter(EmptyState.self)
    }
}
//let vc = MainStateMachineViewController(s)
//var s = TestMainStrategy(
//    states: [
//        EmptyState(viewController: vc),
//        LoadingState(viewController: vc),
//        TestViewState(viewController: vc)
//    ]
//)

public class MainStateMachineViewController: UIViewController, MainTabBarPage {
    
    var stateMachine: GKStateMachine?
//
//    init(_ s: StateMachineStrategy) {
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNav()
        // 狀態機初始化之後就不能增減狀態了，所以要在這邊把全部的狀態建構好再拿來建構狀態機。
        stateMachine = GKStateMachine(states: [
            EmptyState(viewController: self),
            LoadingState(viewController: self),
            TestViewState(viewController: self)
        ])
        // 要狀態機先進入空白狀態。
        stateMachine?.enter(EmptyState.self)
    }

    func setUpNav() {
        navigationController?.navigationBar.backgroundColor = .white
        title = "狀態機1"
    }
}

public class EmptyState: ViewControllerState {
    // 創造包含標籤與按鈕的 emptyView。
    // 設定按鈕的 target 為 self。
    // 用 private 把 emptyView 封裝起來。
    private lazy var emptyView: UIView = {
        let label = UILabel()
        label.text = "No Article"
        let button = UIButton(type: .system)
        button.setTitle("Load Articles", for: .normal)
        button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    // 將 emptyView 加到 view 裡面。
    public override func didEnter(from previousState: GKState?) {
        view.addSubview(emptyView)
        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    // 按下載入按鈕時，呼叫 stateMachine 進入載入狀態。
    @objc func didPressButton(_ sender: UIButton) {
        stateMachine?.enter(LoadingState.self)
    }
    
    // 在離開狀態之前，把 emptyView 從 View 階層移除。
    public override func willExit(to nextState: GKState) {
        emptyView.removeFromSuperview()
    }
    
}

public class LoadingState: ViewControllerState {
    // 網路呼叫的錯誤。
    enum Error: Swift.Error {
        case noData
    }
    // 創造一個 UIActivityIndicatorView。
    private var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .gray)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    public override func didEnter(from previousState: GKState?) {
        // 把 indicatorView 顯示出來。
        view.addSubview(indicatorView)
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        indicatorView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            self.indicatorView.stopAnimating()
            self.stateMachine?.enter(TestViewState.self)
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            self.indicatorView.stopAnimating()

            self.stateMachine?.state(forClass: TestViewState.self)?.textStr.send("呱呱")
            
        
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {

            self.stateMachine?.state(forClass: TestViewState.self)?.textStr.send("哈哈哈")
      
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4, execute: {
   
            self.stateMachine?.state(forClass: TestViewState.self)?.textStr.send("嘻嘻")
          
        })
    }
    // 清理狀態。
    public override func willExit(to nextState: GKState) {
        indicatorView.stopAnimating()
        indicatorView.removeFromSuperview()
    }
}
public class TestViewState: ViewControllerState {
    
    let textStr = CurrentValueSubject<String, Never>("無資料")
    private var cancellable: AnyCancellable?
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var goStockPageButton: UIButton = {
   
        let button = UIButton(type: .system)
        button.setTitle("goStockPage", for: .normal)
        button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 將 emptyView 加到 view 裡面。
    public override func didEnter(from previousState: GKState?) {
        view.addSubview(label)
        view.addSubview(goStockPageButton)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goStockPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goStockPageButton.topAnchor.constraint(equalTo: label.bottomAnchor)
        ])
   
        cancellable = textStr.sink(
        receiveCompletion: { complete in
            print("complete \(complete)")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                
                self.stateMachine?.enter(EmptyState.self)
            })
            
        },
        receiveValue: { value in
            self.setText(value)
            print("value \(value)")
            self.view.backgroundColor = [.gray, .blue, .red, .yellow, .cyan].shuffled()[0]
          }
        )
        
    }
   
    func setText(_ str: String) {
        label.text = str
    }
    // 按下載入按鈕時，呼叫 stateMachine 進入載入狀態。
    @objc func didPressButton(_ sender: UIButton) {
        
        let vc = StockDetailStateMachinViewController(list: ["2330", "2337", "2333", "2331"])
        vc.hidesBottomBarWhenPushed = true
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 在離開狀態之前，把 emptyView 從 View 階層移除。
    public override func willExit(to nextState: GKState) {
        label.removeFromSuperview()
    }

}
