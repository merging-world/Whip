//
//  ChallengeCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct ChallengeCard: View {
    let title: String
    let desc: String
    let content: String
    let percent: Float
    
    var body: some View {
        Card(
            AnyView(
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(self.title)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        Text(self.desc)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            .background(Color.white)
                            .foregroundColor(Color.carrot)
                            .cornerRadius(20)
                        Spacer().frame(height: 24)
                        Text(self.content)
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.white)
                    Spacer()
                    VStack {
                        Image("Trophy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 95, height: 95)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white.opacity(0.4))
                                .frame(width: 80, height: 6)
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white)
                                .frame(width: 80 * CGFloat(percent), height: 6)
                        }
                    }
                }
            ),
            color: Color.carrot
        )
    }
}

struct ChallengeCard_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCard(title: "포토샵 강의 시청", desc: "30일 챌린지", content: "12강", percent: 0.6)
    }
}
