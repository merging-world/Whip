//
//  Divider.swift
//  Whip
//
//  Created by peo on 2022/06/23.
//

import SwiftUI

struct CustomDivider: View {
    var height: CGFloat = 8.0
    var horizontalPadding: CGFloat = 0.0
    
    var body: some View {
        Rectangle()
            .foregroundColor(.lightGray)
            .frame(
                width: UIScreen.main.bounds.width - self.horizontalPadding * 2,
                height: self.height
            )
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
