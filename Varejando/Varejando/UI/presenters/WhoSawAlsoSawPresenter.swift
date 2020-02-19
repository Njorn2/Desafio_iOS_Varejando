//
//  WhoSawAlsoSawPresenter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class WhoSawAlsoSawPresenter: WhoSawAlsoSawPresenterInput {
    weak var output: WhoSawAlsoSawPresenterOutput?
    
    var interactor: WhoSawAlsoSawInteractor?
    
    var products: [ProductsListItemViewModel]? {
        return viewModel
    }
    
    private var viewModel: [ProductsListItemViewModel]? {
        didSet {
            self.output?.update(whoSawAlsoSawModel: viewModel)
        }
    }
    
    init(interactor: WhoSawAlsoSawInteractor) {
        self.interactor = interactor
        self.interactor?.output = self
    }
}

extension WhoSawAlsoSawPresenter {
    func fetch() {
        interactor?.fetch()
    }
}

extension WhoSawAlsoSawPresenter: WhoSawAlsoSawOutput {
    func fetched(products: [ProductSimpleEntity]) {
        var pods: [ProductsListItemViewModel] = []
        products.forEach({product in
            pods.append(RGMapper.parse(from: product))
        })
        
        self.viewModel = pods
    }
}
