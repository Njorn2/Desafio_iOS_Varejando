//
//  ProductDetailsPresenterInput.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

protocol ProductDetailsPresenterInput {
    var output: ProductDetailsPresenterOutput? { get set }
    var details: ProductDetailsViewModel? { get }
    
    func viewWillAppear()
    func viewDidAppear()
}
