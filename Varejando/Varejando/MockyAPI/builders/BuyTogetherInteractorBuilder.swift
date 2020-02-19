//
//  BuyTogetherInteractorBuilder.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class BuyTogetherInteractorBuilder {
    static func make(manager: ProductsSimpleManagerInput) -> BuyTogetherInteractor {
        
        return BuyTogetherInteractor(manager: manager)
    }
}
