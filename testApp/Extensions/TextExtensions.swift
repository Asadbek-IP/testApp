//
//  TextExtensions.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUICore

extension Text {
    init(amount: Double) {
        self.init("$"+String(format: "%.2f", amount))
    }
}
