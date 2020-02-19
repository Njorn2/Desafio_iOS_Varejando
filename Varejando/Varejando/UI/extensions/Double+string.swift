//
//  Double+string.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

extension Double {
    func toBRL() -> String {
        return "R$ " + String(format: "%.2f", self).replacingOccurrences(of: ".", with: ",")
    }
    
    func toPercent() -> String {
        let format = (self.isInt) ? "%.0f" : "%.2f"
        
        return "-" + String(format: format, self).replacingOccurrences(of: ".", with: ",") + "%"
    }
    
    var isInt: Bool {
        return floor(self) == self
    }
}
