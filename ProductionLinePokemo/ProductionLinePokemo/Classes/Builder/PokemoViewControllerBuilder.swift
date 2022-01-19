//
//  PokemoViewControllerBuilder.swift
//  ProductionLinePokemo
//
//  Created by cm0676 on 2022/1/11.
//

import UIKit

public class PokemoMainViewControllerBuilder {

    private var containerViewControllerOrder: [PokemoViewController] = []

    private var title: String = ""
    
    func addTitle(title: String) -> Self {
        self.title = title
        return self
    }
    
    func addViewController(_ vc: PokemoViewController) -> Self {
        containerViewControllerOrder.append(vc)
        return self
    }
    
    func build() -> PokemoMainViewController {
        return PokemoMainViewController(
            title: title, containerViewControllerOrder: containerViewControllerOrder
        )
    }
}

