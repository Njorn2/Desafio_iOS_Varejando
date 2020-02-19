//
//  BuyTogetherPresenter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class BuyTogetherPresenter: BuyTogetherPresenterInput {
    weak var output: BuyTogetherPresenterOutput?
    
    var interactor: BuyTogetherInteractor?
    
    var products: [ProductsListItemViewModel]? {
        return viewModel
    }
    
    private var viewModel: [ProductsListItemViewModel]? {
        didSet {
            self.output?.update(buyTogetherModel: self.viewModel)
        }
    }
    
    init(interactor: BuyTogetherInteractor) {
        self.interactor = interactor
        self.interactor?.output = self
    }
}

extension BuyTogetherPresenter {
    func fetch() {
        interactor?.fetch()
    }
}

extension BuyTogetherPresenter: BuyTogetherOutput {
    func fetched(products: [ProductSimpleEntity]) {
        var pods: [ProductsListItemViewModel] = []
        products.forEach({product in
            pods.append(RGMapper.parse(from: product))
        })
        
        self.viewModel = pods
    }
}
