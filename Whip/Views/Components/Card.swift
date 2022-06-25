//
//  Card.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct Card: View {
    let child: AnyView
    var color: Color?
    var padding: Int?
    var hasShadow: Bool = true
    
    init(_ child: AnyView, color: Color?) {
        self.child = child
        self.color = color ?? Color.white
    }

    init(_ child: AnyView, color: Color?, padding: Int) {
        self.child = child
        self.color = color ?? Color.white
        self.padding = padding
    }
    
    init(_ child: AnyView, color: Color?, padding: Int, hasShadow: Bool) {
        self.child = child
        self.color = color ?? Color.white
        self.padding = padding
        self.hasShadow = hasShadow
    }
    
    var body: some View {
        VStack {
            self.child
        }
        .padding(.all, CGFloat(padding ?? 24))
        .background(color)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(hasShadow == true ? 0.08 : 0), radius: 26, x: 0, y: 0)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(AnyView(Text("Child")), color: nil)
    }
}
