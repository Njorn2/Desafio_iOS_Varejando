//
//  WhoSawBoughtPresenterInput.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

protocol WhoSawBoughtPresenterInput {
    var output: WhoSawBoughtPresenterOutput? { get set }
    var products: [ProductsListItemViewModel]? { get }
}
