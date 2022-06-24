//
//  Card.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct Card: View {
    let child: AnyView
    let color: Color
    
    init(_ child: AnyView, color: Color?) {
        self.child = child
        self.color = color ?? Color.white
    }
    
    var body: some View {
        VStack {
            self.child
        }
        .padding(24)
        .background(color)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.08), radius: 26, x: 0, y: 0)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(AnyView(Text("Child")), color: nil)
    }
}
