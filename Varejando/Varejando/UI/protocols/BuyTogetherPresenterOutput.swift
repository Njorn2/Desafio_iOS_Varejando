//
//  BuyTogetherPresenterOutput.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

protocol BuyTogetherPresenterOutput: class {
    func update(buyTogetherModel: [ProductsListItemViewModel]?)
}
