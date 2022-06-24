//
//  TodayTipCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct Tip: Hashable {
    let title: String
}

struct TodayTipCard: View {
    let tips: [Tip] = [
        Tip(title: "지역 화폐를 만들어보세요 💸"),
        Tip(title: "2학기 국가장학금 신청하세요"),
        Tip(title: "오늘의 핫딜")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("오늘의 당근팁")
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
        NavigationLink(destination: TipDetailView()) {
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
