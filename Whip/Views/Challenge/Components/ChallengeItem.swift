//
//  ChallengeItem.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

import SwiftUI

struct ChallengeItem: View {
    let item: Challenge

    init(_ item: Challenge) {
        self.item = item
    }
    
    var body: some View {
        Card(
            AnyView(
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.title)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        Text(item.desc)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            .background(Color.white)
                            .foregroundColor(item.color)
                            .cornerRadius(20)
                        Spacer().frame(height: 24)
                        Text(item.content)
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                    VStack {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 95, height: 95)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white.opacity(0.4))
                                .frame(width: 80, height: 6)
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 80 * CGFloat(item.percent), height: 6)
                        }
                    }
                }
            ),
            color: item.color
        )
    }
}

struct ChallengeItem_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeItem(Challenge(title: "하루에 천원 저축하기", desc: "30일 챌린지", content: "15,000원", percent: 0.7, color: Color.whip, image: "Piggy"))
    }
}
