//
//  ProductDetailsPresenter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class ProductDetailsPresenter: ProductDetailsPresenterInput {
    weak var output: ProductDetailsPresenterOutput?
    
    var interactor: ProductDetailInteractorInput
    var ratingInteractor: ProductRatingInteractor
    
    var whoSawAlsoSawPresenter: WhoSawAlsoSawPresenter?
    var buyTogetherPresenter: BuyTogetherPresenter?
    var whoSawBoughtPresenter: WhoSawBoughtPresenter?
    
    var details: ProductDetailsViewModel? {
        return viewModel
    }
    
    private var viewModel: ProductDetailsViewModel?
    
    init(interactor: ProductDetailInteractorInput,
         ratingInteractor: ProductRatingInteractor,
         whoSawAlsoSawInteractor: WhoSawAlsoSawInteractor,
         buyTogetherInteractor: BuyTogetherInteractor,
         whoSawBoughtInteractor: WhoSawBoughtInteractor) {
        self.interactor = interactor
        
        self.ratingInteractor = ratingInteractor
        self.ratingInteractor.output = self
        
        self.whoSawAlsoSawPresenter = WhoSawAlsoSawPresenter(interactor: whoSawAlsoSawInteractor)
        self.whoSawAlsoSawPresenter?.output = self
        self.buyTogetherPresenter = BuyTogetherPresenter(interactor: buyTogetherInteractor)
        self.buyTogetherPresenter?.output = self
        self.whoSawBoughtPresenter = WhoSawBoughtPresenter(interactor: whoSawBoughtInteractor)
        self.whoSawBoughtPresenter?.output = self
    }
    
    func viewWillAppear() {
        output?.presentLoading()
    }
    
    func viewDidAppear() {
        interactor.fetch()
    }
    
    func getProduct() -> ProductDetailsViewModel? {
        return viewModel
    }
}

extension ProductDetailsPresenter: ProductRatingInteractorOutput {
    func fetched(rating: RatingEntity) {
        self.viewModel?.rating = RGMapper.parse(from: rating)
        self.whoSawAlsoSawPresenter?.fetch()
    }
}

extension ProductDetailsPresenter: ProductDetailInteractorOutput {
    func fetched(products: ProductDetailEntity) {
        viewModel = RGMapper.parse(from: products)
        self.ratingInteractor.fetch()
    }
}

extension ProductDetailsPresenter: WhoSawAlsoSawPresenterOutput {
    func update(whoSawAlsoSawModel: [ProductsListItemViewModel]?) {
        self.viewModel?.whoSawAlsoSawModel = whoSawAlsoSawModel
        self.buyTogetherPresenter?.fetch()
    }
}

extension ProductDetailsPresenter: BuyTogetherPresenterOutput {
    func update(buyTogetherModel: [ProductsListItemViewModel]?) {
        self.viewModel?.buyTogetherModel = buyTogetherModel
        self.whoSawBoughtPresenter?.fetch()
    }
}

extension ProductDetailsPresenter: WhoSawBoughtPresenterOutput {
    func update(whoSawBoughtModel: [ProductsListItemViewModel]?) {
        self.viewModel?.whoSawBoughtModel = whoSawBoughtModel
        self.output?.updateUI()
    }
}
