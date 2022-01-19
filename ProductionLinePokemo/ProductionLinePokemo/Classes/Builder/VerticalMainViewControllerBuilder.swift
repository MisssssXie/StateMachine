//
//  VerticalUnitViewControllerBuilder.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

public class VerticalMainViewControllerBuilder {

    private var containerViewControllerOrder: [VerticalUnitViewController] = []

    private var title: String = ""
    
    func addTitle(title: String) -> Self {
        self.title = title
        return self
    }
    
    func addViewController(_ vc: VerticalUnitViewController) -> Self {
        containerViewControllerOrder.append(vc)
        return self
    }
    
    func addViewControllers(_ vcs: [VerticalUnitViewController]) -> Self {
        containerViewControllerOrder.append(contentsOf: vcs)
        return self
    }
    
    func build() -> VerticalMainViewController {
        return VerticalMainViewController(
            title: title, containerViewControllerOrder: containerViewControllerOrder
        )
    }
}

