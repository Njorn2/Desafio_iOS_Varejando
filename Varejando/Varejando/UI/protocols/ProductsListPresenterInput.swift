//
//  ProductsListPresenterInput.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

protocol ProductsListPresenterInput {
    var productsCount: Int { get }
    var listBy: ListBy { get }
    var title: String { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func didSelectCell(at index: Int)
    func listBy(type: ListBy)
    func getProduct(at index: Int) -> ProductsListItemViewModel
}
