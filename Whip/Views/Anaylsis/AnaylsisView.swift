//
//  AnaylsisView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct AnaylsisView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("오늘 사용한 돈")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                        Text("32,500원")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                    }
                    .padding(EdgeInsets(top: 32, leading: 24, bottom: 8, trailing: 24))
                    Spacer()
                }
                ComparedScoreCard()
                Divider()
                    .padding(.top, 16)
                VStack {
                    HStack {
                        Text("진행 중인 챌린지")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        Text("1/4")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    ChallengeCard(title: "포토샵 강의 시청", desc: "30일 챌린지", content: "12강", percent: 0.8)
                }
                .padding([.leading, .trailing], 24)
                VStack {
                    HStack {
                        Text("오늘의 당근팁")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    TodayTipCard()
                }
                .padding([.leading, .trailing], 24)
            }
        }
    }
}

struct AnaylsisView_Previews: PreviewProvider {
    static var previews: some View {
        AnaylsisView()
    }
}
