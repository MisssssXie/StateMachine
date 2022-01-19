//
//  StockDetailMainNaviBarTitleView.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/14.
//

import GameplayKit
import Combine

class StockSwitchViewControllerState: ViewControllerState {

    let titleObservable = CurrentValueSubject<String, Never>("")
    private var cancellable: AnyCancellable?
    
    private lazy var titleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (120 * Device.ratioWidth), height: 40))
        return view
    }()
    
    /// 上一支股票按鈕
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        return UIButton()
    }()
    
    /// 下一支股票按鈕
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    /// 股票名稱及代號
    lazy var stockTitle = {
        return UILabel()
    }()
    
    // MARK: - Init
    // 將 emptyView 加到 view 裡面。
    public override func didEnter(from previousState: GKState?) {
        
        let key = stateMachine?.state(forClass: StockDetailMainViewControllerState.self)?.commKey ?? ""
        
        stateMachine?.state(forClass: StockDetailViewControllerState.self)?.commKey.send(key)
        stateMachine?.enter(StockDetailViewControllerState.self)
        
        cancellable = titleObservable
            .sink(receiveValue: { value in
                self.stockTitle.text = value
            })
        
        viewController.navigationItem.titleView = titleView
        setupTitleUI()
    }

    private func setupTitleUI() {
        addUIToSubView()
        setupTitle()
        setupLeftButton()
        setupRightButton()
    }
    
    private func addUIToSubView() {
        titleView.addSubview(leftButton)
        titleView.addSubview(stockTitle)
        titleView.addSubview(rightButton)
    }

    private func setupLeftButton() {
        leftButton.setTitle("◀︎", for: .normal)
        leftButton.setTitleColor(.blue, for: .normal)
        leftButton.addTarget(self, action: #selector(tapLeftButton), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        leftButton.centerYAnchor.constraint(equalTo: stockTitle.centerYAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupTitle() {
        stockTitle.textColor = .black
        stockTitle.textAlignment = .center
        stockTitle.font = .systemFont(ofSize: 18)
        stockTitle.translatesAutoresizingMaskIntoConstraints = false
        stockTitle.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 9).isActive = true
        stockTitle.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        stockTitle.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        stockTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupRightButton() {
        rightButton.setTitle("▶︎", for: .normal)
        rightButton.setTitleColor(.blue, for: .normal)
        rightButton.addTarget(self, action: #selector(tapRightButton), for: .touchUpInside)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.leadingAnchor.constraint(equalTo: stockTitle.trailingAnchor, constant: 9).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        rightButton.centerYAnchor.constraint(equalTo: stockTitle.centerYAnchor).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    @objc func tapLeftButton() {
        stateMachine?.state(forClass: StockDetailMainViewControllerState.self)?.didTapLeftButton()
    }
    
    @objc func tapRightButton() {
        stateMachine?.state(forClass: StockDetailMainViewControllerState.self)?.didTapRightButton()
    }
}
