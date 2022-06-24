//
//  TodayTipCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct TodayTipCard: View {
    var body: some View {
        Card(
            AnyView(
                VStack(spacing: 24) {
                    HStack {
                        Text("지역 화폐를 만들어보세요 💸")
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color.carrot)
                    }
                    HStack {
                        Text("2학기 국가장학금 신청하세요")
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color.carrot)
                    }
                    HStack {
                        Text("오늘의 핫딜")
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color.carrot)
                    }
                }
            ),
            color: nil
        )
    }
}

struct TodayTipCard_Previews: PreviewProvider {
    static var previews: some View {
        TodayTipCard()
    }
}
