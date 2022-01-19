//
//  StockPickingPageStyle.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/13.
//

import UIKit
public class StockPickingPageStyle {
    
    public init() {}
    
    // MARK: - 顏色
    
    /// 背景顏色
    public var mainBackgroundColor: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    /// 多方空方按鈕的背景顏色
    public var stockPickingSegmentViewBackgroundColor: UIColor = .clear
    
    /// 多方按鈕選取時的背景顏色
    public var longButtonSelectedBackgroundColor: UIColor = .clear

    /// 空方按鈕選取時的背景顏色
    public var shortButtonSelectedBackgroundColor: UIColor = .clear
    
    /// 多方字樣選取時的字體顏色
    public var longButtonSelectedTitleColor: UIColor = UIColor(red: 248/255, green: 68/255, blue: 68/255, alpha: 1)
    
    /// 多方字樣選取時的字體顏色
    public var shortButtonSelectedTitleColor: UIColor = UIColor(red: 71/255, green: 171/255, blue: 117/255, alpha: 1)
    
    /// 多方字樣選取時的底線顏色
    public var longButtonSelectedBottomLineColor: UIColor = UIColor(red: 248/255, green: 68/255, blue: 68/255, alpha: 1)
    
    /// 多方字樣選取時的底線顏色
    public var shortButtonSelectedBottomLineColor: UIColor = UIColor(red: 71/255, green: 171/255, blue: 117/255, alpha: 1)
    
    /// 多方字樣未選取時的字體顏色
    public var longButtonUnselectedTitleColor: UIColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
    
    /// 空方字樣未選取時的字體顏色
    public var shortButtonUnselectedTitleColor: UIColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
    
    // MARK: - StockPickingMenuBar

    /// StockPickingMenuBar 背景色
    public var stockPickingMenuBarBackgroundColor: UIColor = .clear
    
    /// StockPickingMenuBar 邊框色
    public lazy var stockPickingMenuBarBorderColor: UIColor = .clear
    
    /// 空方字樣未被選取時的字體顏色
    public var recommdationDownButtonUnselectedTitleColor: UIColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
    
    /// 多方字樣未被選取時的字體顏色
    public var recommdationRiseButtonUnselectedTitleColor: UIColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
    
    /// 空方字樣選取時的字體顏色
    public var recommdationDownButtonSelectedTitleColor: UIColor = UIColor(red: 21/255, green: 20/255, blue: 20/255, alpha: 1)
    
    /// 多方字樣選取時的字體顏色
    public var recommdationRiseButtonSelectedTitleColor: UIColor = UIColor(red: 21/255, green: 20/255, blue: 20/255, alpha: 1)
    
    /// 多方的未選取時邊框色
    public var recommdationRiseUnselectedBackgroundColor: UIColor = .clear
    
    /// 空方的未選取時邊框色
    public var recommdationDownUnselectedBackgroundColor: UIColor = .clear
    
    /// 股票數量未選取時文字顏色
    public var countLableUnselectedTextColor: UIColor = UIColor(red: 21/255, green: 20/255, blue: 20/255, alpha: 1)
    
    /// 股票數量選取時文字顏色
    public var countLableSelectedTextColor: UIColor = UIColor(red: 21/255, green: 20/255, blue: 20/255, alpha: 1)
    
    /// 股票數量未選取時背景顏色
    public var countLableUnselectedBackgroundColor: UIColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    
    /// 股票數量選取時背景顏色
    public lazy var countLableSelectedBackgroundColor: UIColor = UIColor(red: 255 / 255, green: 177 / 255, blue: 59 / 255, alpha: 1)
    
    /// 多方策略選取時的背景色
    public lazy var strategyBarRiseSelectedBackgroundColor: UIColor = UIColor(red: 255 / 255, green: 177 / 255, blue: 59 / 255, alpha: 1)
    
    /// 空方策略選取時的背景色
    public lazy var strategyBarDownSelectedBackgroundColor: UIColor = UIColor(red: 255 / 255, green: 177 / 255, blue: 59 / 255, alpha: 1)
    
    
    /// 策略分隔條狀物顏色
    public var strategyBarSeparatorViewBackgroundColor: UIColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 1)
    
    /// 策略選取時的字體色
    public var strategyTitleUnselectedColor: UIColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    
    /// 策略MenuBar的背景顏色
    public var strategyMenuBarBackgroundColor: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    /// 策略未選取時的字體色
    public lazy var strategyTitleSelectedColor: UIColor = UIColor(red: 255 / 255, green: 177 / 255, blue: 59 / 255, alpha: 1)
    
    /// 搜尋圖示之顏色
    public var searchImageColor: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    // MARK: - 字體
    
    /// 策略按鈕未選取時的字體
    public var strategyUnselectedFont: UIFont = .systemFont(ofSize: 14)
    
    /// 策略按鈕選取時的字體
    public var strategySelectedFont: UIFont = .systemFont(ofSize: 17)
    
    // MARK: - 圖片
    public var searchIcon: UIImage = UIImage(systemName: "face.smiling") ?? UIImage()
    
    /// marketingMarquee 背景色
    public var marketingMarqueeBackgroundColor: UIColor = .clear
    
    /// marketingMarquee 文字顏色
    public var marketingMarqueeTextColor: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    // MARK: - Filter Button
    
    /// Filter Button 文字顏色
    public var filterButtonTitleTextColor: UIColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1)
    
    /// Filter Button 文字字體
    public var filterButtonTitleTextFont: UIFont = .systemFont(ofSize: 16)
    
}
