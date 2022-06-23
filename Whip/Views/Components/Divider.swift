//
//  Divider.swift
//  Whip
//
//  Created by peo on 2022/06/23.
//

import SwiftUI

struct Divider: View {
    var height: CGFloat = 8.0
    
    var body: some View {
        Rectangle()
            .foregroundColor(.divider)
            .frame(width: UIScreen.main.bounds.width, height: self.height)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Divider()
    }
}
