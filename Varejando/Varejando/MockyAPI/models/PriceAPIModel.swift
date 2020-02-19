//
//  PriceAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct PriceAPIModel: Codable {
    var paymentPlan: String?
    var installmentsValue: Double = 0
    var maxInstallmentsCount: Int = 0
    var currentPrice: Double = 0
    var previousPrice: Double = 0
    var discountPercent: Double = 0
    var discountPaymentMethod: PaymentMethodAPIModel?
    
    enum CodingKeys: String, CodingKey {
        case paymentPlan = "planoPagamento"
        case installmentsValue = "valorParcela"
        case maxInstallmentsCount = "quantidadeMaximaParcelas"
        case currentPrice = "precoAtual"
        case previousPrice = "precoAnterior"
        case discountPercent = "porcentagemDesconto"
        case discountPaymentMethod = "descontoFormaPagamento"
    }
}
