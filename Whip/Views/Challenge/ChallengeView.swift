//
//  ChallengeView.swift
//  Whip
//
//  Created by peo on 2022/06/23.
//

import SwiftUI

struct ChallengeView: View {
    @State var challenges: [Challenge] = [
        Challenge(title: "포토샵 강의 신청", desc: "30일 챌린지", content: "12강", percent: 0.8, color: Color.carrot, image: "Paint"),
        Challenge(title: "하루에 천원 저축하기", desc: "30일 챌린지", content: "15,000원", percent: 0.3, color: Color.whip, image: "Piggy")
    ]
    @State var isAdd = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Text("챌린지")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 32, leading: 24, bottom: 16, trailing: 24))
                        Spacer()
                    }
                    VStack(spacing: 24) {
                        ForEach(challenges, id: \.self) { item in
                            ChallengeItem(item)
                        }
                        self.addChallengeView
                    }
                    .padding(24)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

extension ChallengeView {
    @ViewBuilder
    var addChallengeView: some View {
        NavigationLink(isActive: self.$isAdd, destination: {
            AddChallengeView(isAdd: self.$isAdd, originalList: self.$challenges)
        }) {
            Button {
                self.isAdd = true
            } label: {
                Card(
                    AnyView(
                        HStack {
                            Spacer()
                            VStack(spacing: 8) {
                                Image(systemName: "plus")
                                Text("새로운 챌린지를 추가해보세요!")
                            }
                            .padding([.top, .bottom], 24)
                            .foregroundColor(Color.blueGray)
                            Spacer()
                        }
                    ),
                    color: Color.lightGray,
                    padding: 24,
                    hasShadow: false
                )
            }
        }
        
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
