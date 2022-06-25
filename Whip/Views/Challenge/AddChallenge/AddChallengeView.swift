//
//  AddChallengView.swift
//  Whip
//
//  Created by peo on 2022/06/26.
//

import SwiftUI

struct AddChallengeView: View {
    @Binding var isAdd: Bool
    @Binding var originalList: [Challenge]
    
    var challenges: [Challenge] = [
        Challenge(title: "원데이 세미나 시청", desc: "1일 챌린지", content: "총 1회", percent: 0, color: Color.carrot, image: "Bag"),
        Challenge(title: "책 1권 읽기", desc: "7일 챌린지", content: "총 1권", percent: 0, color: Color.carrot, image: "Book"),
        Challenge(title: "포토샵 강의 시청", desc: "30일 챌린지", content: "총 20강권", percent: 0, color: Color.carrot, image: "Paint")
    ]
    @State var selectedArray = [true, false, false]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Text("챌린지 추가하기")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 32, leading: 24, bottom: 16, trailing: 24))
                    Spacer()
                }
                
                VStack(spacing: 24) {
                    ForEach(0..<challenges.count, id: \.self) { index in
                        Button(action: {
                            self.selectedArray[0] = false
                            self.selectedArray[1] = false
                            self.selectedArray[2] = false
                            self.selectedArray[index] = true
                        }) {
                            NewChallengeItem(item: challenges[index], selected: self.$selectedArray[index])
                        }
                    }
                    
                    Button(action: {
                        if self.selectedArray[0] {
                            originalList.append(challenges[0])
                        } else if self.selectedArray[1] {
                            originalList.append(challenges[1])
                        } else {
                            originalList.append(challenges[2])
                        }
                        self.isAdd = false
                    }) {
                        Text("확인")
                            .bold()
                    }
                    .buttonStyle(BigButtonStyle(fontSize: 18, fontColor: .white, backgroundColor: .carrot))
                }
                .padding(.top, 16)
                .padding([.horizontal, .bottom], 24)
            }
        }
        .navigationBarHidden(true)
    }
}
