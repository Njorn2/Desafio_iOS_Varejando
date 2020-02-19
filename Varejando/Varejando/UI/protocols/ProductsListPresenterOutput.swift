//
//  ProductsListPresenterOutput.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

protocol ProductsListPresenterOutput: class {
    func updateUIList()
    func updateUIListType()
    func presentLoading()
}
