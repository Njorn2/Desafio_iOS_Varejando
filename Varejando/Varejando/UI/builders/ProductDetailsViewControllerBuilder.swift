//
//  ProductDetailsViewControllerBuilder.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductDetailsViewControllerBuilder {
    static func make(router: ProductDetailsRouter) -> DetailsViewController {
        let viewController = DetailsViewController(nibName: nil,
            bundle: nil)
        let manager = ProductDetailManager()
        let interactor = ProductsDetailInteractorBuilder.make(manager: manager)
        
        let ratingManager = ProductRatingManager()
        let ratingInteractor = ProductsRatingInteractorBuilder.make(manager: ratingManager)
        
        let whoSawAlsoSawManager = WhoSawAlsoSawManager()
        let whoSawAlsoSawInteractor = WhoSawAlsoSawInteractorBuilder.make(manager: whoSawAlsoSawManager)
        
        let buyTogetherManager = BuyTogetherManager()
        let buyTogetherInteractor = BuyTogetherInteractorBuilder.make(manager: buyTogetherManager)
        
        let whoSawBoughtManager = WhoSawBoughtManager()
        let whoSawBoughtInteractor = WhoSawBoughtInteractorBuilder.make(manager: whoSawBoughtManager)
        
        let presenter = ProductDetailsPresenter(interactor: interactor,
                                                ratingInteractor: ratingInteractor,
                                                whoSawAlsoSawInteractor: whoSawAlsoSawInteractor,
                                                buyTogetherInteractor: buyTogetherInteractor,
                                                whoSawBoughtInteractor: whoSawBoughtInteractor)
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
