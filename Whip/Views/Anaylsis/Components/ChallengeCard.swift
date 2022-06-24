//
//  ChallengeCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct Challenge: Hashable {
    let title: String
    let desc: String
    let content: String
    let percent: Float
    let color: Color
    let image: String
}

struct ChallengeCard: View {
    let challenges: [Challenge] = [
        Challenge(title: "포토샵 강의 신청", desc: "30일 챌린지", content: "12강", percent: 0.8, color: Color.carrot, image: "Trophy"),
        Challenge(title: "하루에 천원 저축하기", desc: "30일 챌린지", content: "15,000원", percent: 0.3, color: Color.whip, image: "Piggy"),
        Challenge(title: "일주일에 책 한권", desc: "30일 챌린지", content: "10권", percent: 0.1, color: Color.carrot, image: "Trophy")
    
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("진행 중인 챌린지")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                Text("\(self.challenges.count)개")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 24, bottom: 8, trailing: 24))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    Spacer().frame(width: 20)
                    ForEach(challenges, id: \.self) { item in
                        challengeItem(item)
                    }
                    Spacer().frame(width: 20)
                }
                .padding([.top, .bottom], 36)
            }
            .padding(-20)
        }
    }
    
    @ViewBuilder
    func challengeItem(_ item: Challenge) -> some View {
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
        .frame(width: 320)
    }
}

struct ChallengeCard_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCard()
    }
}
