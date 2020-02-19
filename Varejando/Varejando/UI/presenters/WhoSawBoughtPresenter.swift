//
//  WhoSawAlsoBoughtPresenter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class WhoSawBoughtPresenter: WhoSawBoughtPresenterInput {
    weak var output: WhoSawBoughtPresenterOutput?
    
    var interactor: WhoSawBoughtInteractor?
    
    var products: [ProductsListItemViewModel]? {
        return viewModel
    }
    
    private var viewModel: [ProductsListItemViewModel]? {
        didSet {
            self.output?.update(whoSawBoughtModel: self.viewModel)
        }
    }
    
    init(interactor: WhoSawBoughtInteractor) {
        self.interactor = interactor
        self.interactor?.output = self
    }
}

extension WhoSawBoughtPresenter {
    func fetch() {
        interactor?.fetch()
    }
}

extension WhoSawBoughtPresenter: WhoSawBoughtOutput {
    func fetched(products: [ProductSimpleEntity]) {
        var pods: [ProductsListItemViewModel] = []
        products.forEach({product in
            pods.append(RGMapper.parse(from: product))
        })
        
        self.viewModel = pods
    }
}
