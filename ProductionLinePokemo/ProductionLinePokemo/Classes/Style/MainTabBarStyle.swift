//
//  MainTabBarStyle.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/12.
//

import UIKit

public class MainTabBarStyle {
    // MARK: - 主要Style
    
    public var themeColor: UIColor = UIColor(red: 255 / 255, green: 177 / 255, blue: 59 / 255, alpha: 1)
    
    /// 背景色
    public var mainBackground: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    
    /// tabbar 被選的顏色
    public lazy var tabbarTitleSelected: UIColor = themeColor
    
    /// Navigation 背景色
    public var mainNavigationBackground: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1) {
        didSet {
            updateNavigationAppearance(self.mainNavigationBackground)
        }
    }
    
    /// Navigation tint color 預設 white
    public var tintColor: UIColor = .black
    
    /// Navigation text color 預設 white
    public var titleTextColor: UIColor = .black
    
    /// Navigation text font 預設 PintFang  20
    public var titleTextFont: UIFont = .getPintFang(ofSize: 20, weight: .medium)
    
    
    /// Tab bar 背景色
    public var mainTabBarBackground: UIColor = UIColor(red: 37/255, green: 35/255, blue: 35/255, alpha: 1)
    
    private func updateNavigationAppearance(_ color: UIColor) {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = color
    }

}

extension UIFont {
    
    static func getWeightString(weight: Weight) -> String {
        
        switch weight {
        case .regular:
            return "Regular"
        case .medium:
            return "Medium"
        case .semibold:
            return "Semibold"
        default:
            return "Regular"
        }
    }
    
    static func getPintFang(ofSize size: CGFloat, weight: Weight = .regular) -> UIFont {
        let weightStr = getWeightString(weight: weight)
        let font = UIFont(name: "PingFangTC-\(weightStr)", size: size)
        return font ?? .systemFont(ofSize: size, weight: weight)
    }
}
