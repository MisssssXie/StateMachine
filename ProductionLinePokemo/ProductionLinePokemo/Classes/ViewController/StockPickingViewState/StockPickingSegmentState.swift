//
//  StockPickingSegmentView.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/13.
//

import GameplayKit

// 模式
enum PickingType: Int {
    case long = 0
    case short
}

class StockPickingSegmentState: ViewControllerState {
    
    
    // MARK: - UI Properties
    
    lazy var titleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (120 * Device.ratioWidth), height: 40))
        return view
    }()
    
    /// 多方按鈕
    private lazy var longButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 12, y: 6, width: (38 * Device.ratioWidth).adjustedWidth, height: 24))
        return button
    }()
    
    /// 空方按鈕
    private lazy var shortButton: UIButton = {
        let button = UIButton(frame: CGRect(x: (72), y: 6, width: (38 * Device.ratioWidth).adjustedWidth, height: 24))
        return button
    }()
    
    /// 動畫底線
    private lazy var bottomLineView: UIView = {
        let view = UIView(frame: CGRect(x: 18, y: 34, width: (24 * Device.ratioWidth).adjustedWidth, height: 2))
        return view
    }()
    
    private let bottomLineShortFrame = CGRect(x: 80, y: 34, width: (24 * Device.ratioWidth).adjustedWidth, height: 2)
    
    private let bottomLineLongFrame = CGRect(x: 18, y: 34, width: (24 * Device.ratioWidth).adjustedWidth, height: 2)
    
    /// StyleManager
    private var style: StockPickingPageStyle = StockPickingPageStyle()
    
    // MARK: - Properties
    
    /// 模式對應的按鈕（dictionary）
    private var currentRecommdationButton: [PickingType: UIButton] = [:]
    
    /// 目前編輯模式及更變時要做的設定
    var currentChoosedMode: PickingType = .long

    // MARK: - Init
    // 將 emptyView 加到 view 裡面。
    public override func didEnter(from previousState: GKState?) {
        //view.addSubview(titleView)
        viewController.navigationItem.titleView = titleView
        setupUI()
        stateMachine?.enter(StockPickingMainState.self)
    }
}

// MARK: - Setup methods

extension StockPickingSegmentState {
    
    private func setupUI() {
        
        // 設定標題 View
        titleView.backgroundColor = style.stockPickingSegmentViewBackgroundColor
        titleView.layer.cornerRadius = 16
        titleView.addSubview(shortButton)
        titleView.addSubview(longButton)
        
        // 設定多方按鈕
        longButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        longButton.layer.cornerRadius = 14
        longButton.addTarget(self, action: #selector(riseTapped), for: .touchUpInside)
        longButton.setTitle("多方", for: .normal)
        
        // 設定空方按鈕
        shortButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        shortButton.layer.cornerRadius = 14
        shortButton.addTarget(self, action: #selector(downTapped), for: .touchUpInside)
        shortButton.setTitle("空方", for: .normal)
        
        currentRecommdationButton[.long] = longButton
        currentRecommdationButton[.short] = shortButton
        currentChoosedMode = .long
        changeToLongModeUI()
        
        // 動畫底線
        titleView.addSubview(bottomLineView)
        bottomLineView.backgroundColor = style.longButtonSelectedBottomLineColor
        bottomLineView.layer.cornerRadius = 1
    }
    
    private func bottomLineViewAnimateToLongButton() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.bottomLineView.frame = self.bottomLineLongFrame
            self.bottomLineView.backgroundColor = self.style.longButtonSelectedBottomLineColor
        }, completion: nil)
    }
    
    private func bottomLineViewAnimateToShortButton() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let self = self else { return }
            self.bottomLineView.frame = self.bottomLineShortFrame
            self.bottomLineView.backgroundColor = self.style.shortButtonSelectedBottomLineColor
        }, completion: nil)
    }
}

// MARK: - Action Methods

extension StockPickingSegmentState {
    
    /// 點擊多方按鈕
    @objc func riseTapped() {
        guard currentChoosedMode != .long else { return }
        currentChoosedMode = .long
        changeToLongModeUI()
        stateMachine?.state(forClass: StockPickingMainState.self)?.setPageViewControllerToLong()
    }
    
    /// 點擊空方按鈕
    @objc func downTapped() {
        guard currentChoosedMode != .short else { return }
        currentChoosedMode = .short
        changeToShortModeUI()
        stateMachine?.state(forClass: StockPickingMainState.self)?.setPageViewControllerToShort()
    }
    
    private func changeToLongModeUI() {
            currentRecommdationButton[.short]?.backgroundColor = .clear
            currentRecommdationButton[.short]?.setTitleColor(style.shortButtonUnselectedTitleColor, for: .normal)
            currentRecommdationButton[.short]?.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
            
            currentRecommdationButton[.long]?.backgroundColor = style.longButtonSelectedBackgroundColor
            currentRecommdationButton[.long]?.setTitleColor(style.longButtonSelectedTitleColor, for: .normal)
            currentRecommdationButton[.long]?.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
            
            bottomLineViewAnimateToLongButton()
    }
    
    private func changeToShortModeUI() {
        currentRecommdationButton[.long]?.backgroundColor = .clear
        currentRecommdationButton[.long]?.setTitleColor(style.longButtonUnselectedTitleColor, for: .normal)
        currentRecommdationButton[.long]?.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        
        currentRecommdationButton[.short]?.backgroundColor = style.shortButtonSelectedBackgroundColor
        currentRecommdationButton[.short]?.setTitleColor(style.shortButtonSelectedTitleColor, for: .normal)
        currentRecommdationButton[.short]?.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        
        bottomLineViewAnimateToShortButton()
    }
}



