//
//  AnaylsisView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct AnaylsisView: View {
    var body: some View {
        NavigationView {
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
                    CustomDivider()
                        .padding([.top, .bottom], 16)
                    ChallengeCard()
                    TodayTipCard()
                }
            }
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AnaylsisView_Previews: PreviewProvider {
    static var previews: some View {
        AnaylsisView()
    }
}
