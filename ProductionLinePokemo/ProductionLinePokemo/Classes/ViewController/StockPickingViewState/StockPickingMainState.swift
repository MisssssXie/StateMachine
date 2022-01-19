//
//  StockPickingMainViewController.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/13.
//

import GameplayKit

public class StockPickingMainState: ViewControllerState {
    
    // MARK: - Enumerations
    
    enum PageType: Int {
        case long
        case short
    }
    
    enum PageViewControllerMoveType {
        case before
        case after
    }
    
    /// 操作換頁
    private lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pageVC
    }()
    
    /// 切換頁面之陣列
    private var viewControllers: [UIViewController] = []
    
    /// 預設之內容頁狀態
    private var pageType = PageType.long
    
    private var currentStrategyIndex = 0
    
    public override func didEnter(from previousState: GKState?) {
        setupPageViewController()
        setupDefaultViewControllers()
    }
    
    
    private func setupPageViewController() {
        // 加入其他 controller 的前置動作
        viewController.addChild(pageViewController)
        view.addSubview(pageViewController.view)
        // 通知 pageViewController 被加進 self 裡面（成為self 的 child view）
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.didMove(toParent: viewController)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    /// 預設尚未取到資料時的空畫面
    private func setupDefaultViewControllers() {
        // 多方
        let longVc = VerticalMainViewControllerBuilder()
            .addViewControllers([VerticalUnitViewController(height: 220),
                                 VerticalUnitViewController(height: 160),
                                 VerticalUnitViewController(height: 40)
                               ])
            .build()
        
        viewControllers.append(longVc)
        // 空方
        let shortVc = MainStateMachineViewController()
        viewControllers.append(shortVc)
        
        disablePageViewControllerSwipeGesture()
        
        if let firstVC = viewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    private func disablePageViewControllerSwipeGesture() {
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
    
    func setPageViewControllerToLong() {
        if let vc = viewControllers.first {
            pageViewController.setViewControllers([vc], direction: .reverse, animated: true, completion: nil)
        }
    }
    
    func setPageViewControllerToShort() {
        if let vc = viewControllers.last {
            pageViewController.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }
    

}

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate

extension StockPickingMainState: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex - 1
        
        guard viewControllers.indices.contains(nextIndex) else {
            return nil
        }
        
        return viewControllers[nextIndex]
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        
        guard viewControllers.indices.contains(nextIndex) else {
            return nil
        }
        
        return viewControllers[nextIndex]
    }
}
