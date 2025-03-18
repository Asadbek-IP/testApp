//
//  FontStyleExtensions.swift
//  testApp
//
//  Created by Asadbek Bekchanov on 18/03/25.
//

import SwiftUI

enum FontWeight {
    case regular
    case medium
    case semiBold
    case bold
}

extension Font {
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .regular:
            Font.custom("DMSans-Regular", size: size)
        case .medium:
            Font.custom("DMSans-Medium", size: size)
        case .semiBold:
            Font.custom("DMSans-SemiBold", size: size)
        case .bold:
            Font.custom("DMSans-Bold", size: size)
        }
    }
}

extension Text {
    func customFont(_ fontWeight: FontWeight? = .regular, _ size: CGFloat? = nil) -> Text {
        return self.font(.customFont(fontWeight ?? .regular, size ?? 16))
    }
}
