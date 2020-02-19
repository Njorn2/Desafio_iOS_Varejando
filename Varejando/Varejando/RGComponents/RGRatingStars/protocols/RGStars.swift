//
//  RGStars.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

protocol RGStars {
    var rating: Double? { get }
    var color: UIColor? { get }
    var starSize: CGSize? { get }
    
    func setup()
    func setupStars()
    func addStars()
    
}
