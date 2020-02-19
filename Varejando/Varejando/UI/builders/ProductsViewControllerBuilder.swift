//
//  ProductsViewControllerBuilder.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class ProductsViewControllerBuilder {
    
    static func make(router: ProductsRouter) -> UIViewController? {

        guard let viewController = UIStoryboard(name: "Main",
                                                bundle: nil)
            .instantiateViewController(identifier: "ViewController") as? ViewController else { return nil }
        
        let manager = ProductsListManager()
        let interactor = ProductsListInteractorBuilder.make(manager: manager)
        let presenter = ProductsPresenterBuilder.make(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
