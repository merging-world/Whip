//
//  NewChallengeItem.swift
//  Whip
//
//  Created by peo on 2022/06/26.
//

import SwiftUI

struct NewChallengeItem: View {
    let item: Challenge
    @Binding var selected: Bool
    
    var body: some View {
        Card(
            AnyView(
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.title)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundColor(self.selected ? .white : .carrot)
                        Text(item.desc)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundColor(self.selected ? .white : .darkGray)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8))
                            
                        Spacer().frame(height: 24)
                        Text(item.content)
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .foregroundColor(self.selected ? .white : .carrot)
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 95, height: 95)
                }
            ),
            color: self.selected ? .carrot : Color.card
        )
    }
}
