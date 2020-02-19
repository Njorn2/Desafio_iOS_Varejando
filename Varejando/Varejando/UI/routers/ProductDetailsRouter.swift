//
//  ProductDetailsRouter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsRouter {
    func present(navigationController: UINavigationController) {
        navigationController.pushViewController(ProductDetailsViewControllerBuilder.make(router: self), animated: true)
    }
}
