//
//  TodayTipCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct TodayTipCard: View {
    let tips: [Tip] = [
        Tip(title: "지역 화폐를 만들어보세요 💸",
            detailTitle: "지역화폐 사용하고\n10% 아끼자",
            desc: "규환님이 살고 계신 경기도의 경우\n'경기지역화폐'를 사용하면\n10% 환급을 받을 수 있습니다.",
            type: 1,
            content: [
                TipContent(
                    title: "지난 달 지역화폐\n가맹점에서 사용한 돈", desc: "231,000원", type: 1
                ),
                TipContent(
                    title: "지난 달 지역화폐를 사용했으면\n아낄 수 있었던 돈", desc: "23,100원", type: 2
                )
            ],
            link: "https://google.com", linkTitle: "지역화폐 신청하러 가기"
        ),
        Tip(title: "규환님을 위한 원데이 세미나",
            detailTitle: "하루를 의미있게,\n원데이 세미나",
            desc: "규환님의 커리어를 위한\n'원데이 세미나'들을 찾아왔어요.",
            type: 0,
            content: [
                TipContent(title: "스스로 성장하는\n분석가 커리어 만들기", image: "sample1", type: 0),
                TipContent(title: "SQL로 시작하는\n데이터 분석", image: "sample2", type: 0)
            ]
        ),
        Tip(title: "데이터 분석가를 위한 맞춤 자격증",
            detailTitle: "데이터 분석가\n맞춤 자격증 추천",
            desc: "규환님의 커리어를 위한\n'자격증'들을 찾아왔어요.",
            type: 0,
            content: [
                TipContent(title: "빅데이터 분석기사", type: 0),
                TipContent(title: "ADsP (데이터분석 준전문가)", type: 0),
                TipContent(title: "DAP (데이터아키텍처 전문가)", type: 0),
                TipContent(title: "SQLP (SQL 준전문가)", type: 0)
            ]
        ),
        Tip(title: "왜 신청 안 해?  맞춤 장학금 추천",
            detailTitle: "왜 신청 안 해?\n맞춤 장학금 추천",
            desc: "규환님이 신청할 수 있는\n'맞춤 장학금'들을 찾아왔어요.",
            type: 1,
            content: [
                TipContent(title: "KT&G 장학재단", desc: "7월 12일 ~ 8월 1일", type: 0),
                TipContent(title: "STX 장학재단", desc: "7월 20일 ~ 8월 5일", type: 0)
            ]
        )
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("오늘의 팁")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.top, 32)
            .padding(.bottom, 16)
            Card(
                AnyView(
                    VStack(spacing: 24) {
                        ForEach(tips, id: \.self) { item in
                            tipItem(item)
                        }
                    }
                ),
                color: nil
            )
        }
        .padding([.leading, .trailing], 24)
        .padding(.bottom, 32)
    }
    
    @ViewBuilder
    func tipItem(_ item: Tip) -> some View {
        NavigationLink(destination: TipDetailView(tip: item)) {
            HStack {
                Text(item.title)
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(Color.carrot)
            }
        }
    }
}

struct TodayTipCard_Previews: PreviewProvider {
    static var previews: some View {
        TodayTipCard()
    }
}
