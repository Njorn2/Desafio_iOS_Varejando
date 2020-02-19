//
//  ProductsRouter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class ProductsRouter {
    
    var navigationController: UINavigationController?
    
    func present(in window: UIWindow) {
        window.makeKeyAndVisible()
        guard let viewController = ProductsViewControllerBuilder.make(router: self) else { return }
        navigationController = UINavigationController(rootViewController: viewController)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.title,
                              NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = UIColor.buttonGreen
        window.rootViewController = navigationController
    }
    
    func presentDetails() {
        
        guard let navigationController = self.navigationController else { return }
        ProductDetailsRouter().present(navigationController: navigationController)
    }
}
