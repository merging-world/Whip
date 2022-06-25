//
//  BigButtonStyle.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct BigButtonStyle: ButtonStyle {
    let fontSize: CGFloat
    let fontColor: Color
    let backgroundColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
            Spacer()
        }
        .padding(.vertical, 12)
        .font(.system(size: self.fontSize))
        .foregroundColor(self.fontColor)
        .background(self.backgroundColor)
        .cornerRadius(10)
    }
}
