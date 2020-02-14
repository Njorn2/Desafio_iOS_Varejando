//
//  ProductsListManagerInpu.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

typealias ProductsListHandler = ((ProductsAPIModel) -> Void)

protocol ProductsListManagerInput {
    func getList(completion: @escaping ProductsListHandler)
}
