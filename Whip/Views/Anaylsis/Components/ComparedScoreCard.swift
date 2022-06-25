//
//  ComparedScoreCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct Index {
    let peerPercent: Float
    let myPercent: Float
    let score: Int
    let name: String
    let color: Color
}

struct ComparedScoreCard: View {
    @State var selected = 0 // 0 - 당근지수, 1 - 채찍지수
    let index: [Index] = [
        Index(peerPercent: 0.36, myPercent: 0.72, score: 36, name: "당근지수", color: Color.carrot),
        Index(peerPercent: 0.77, myPercent: 0.48, score: -29, name: "채찍지수", color: Color.whip)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        self.selected = 0
                    }
                } label: {
                    Card(
                        AnyView(
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("당근지수")
                                        .font(.system(size: 18))
                                        .foregroundColor(self.selected == 0 ? Color.white : Color.fontColor)
                                    Text("72점")
                                        .font(.system(size: 28))
                                        .fontWeight(.bold)
                                        .foregroundColor(self.selected == 0 ? Color.white : Color.carrot)
                                }
                                Spacer()
//                                Image("Carrot")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 32, height: 64)
                            }
                        ),
                        color: self.selected == 0 ? Color.carrot : nil
                    )
                    .padding([.trailing], 8)
                }
                Button {
                    withAnimation {
                        self.selected = 1
                    }
                } label: {
                    Card(
                        AnyView(
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("채찍지수")
                                        .font(.system(size: 18))
                                        .foregroundColor(self.selected == 1 ? Color.white : Color.fontColor)
                                    Text("48점")
                                        .font(.system(size: 28))
                                        .fontWeight(.bold)
                                        .foregroundColor(self.selected == 1 ? Color.white : Color.whip)
                                }
                                Spacer()
                            }
                        ),
                        color: self.selected == 1 ? Color.whip : nil
                    )
                    .padding([.leading], 8)
                }
            }
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 8, trailing: 24))
            Card(
                AnyView(
                    VStack(alignment: .leading) {
                        Text("내 \(self.index[selected].name)는")
                            .font(.system(size: 18))
                        HStack {
                            Text("또래보다")
                                .font(.system(size: 18))
                            Text("\(abs(self.index[selected].score))점")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(self.index[selected].color)
                            Text("\(self.index[selected].score > 0 ? "높아요" : "낮아요")")
                                .font(.system(size: 18))
                        }
                        Spacer().frame(height: 45)
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.modernGray)
                                    .frame(width: geo.size.width, height: 10)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(self.index[selected].color)
                                    .frame(width: geo.size.width * CGFloat(self.index[selected].myPercent), height: 10)
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 8, height: 8)
                                    .offset(x: geo.size.width * CGFloat(self.index[selected].peerPercent) - 9)
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 8, height: 8)
                                    .offset(x: geo.size.width * CGFloat(self.index[selected].myPercent) - 9)
                                Text("또래 점수")
                                    .font(.system(size: 10))
                                    .offset(x: geo.size.width * CGFloat(self.index[selected].peerPercent) - 24, y: -16)
                                Text("내 점수")
                                    .font(.system(size: 10))
                                    .offset(x: geo.size.width * CGFloat(self.index[selected].myPercent) - 18, y: 16)
                            }
                        }
                        Spacer().frame(height: 10)
                    }
                ),
                color: nil
            )
            .padding(EdgeInsets(top: 8, leading: 24, bottom: 24, trailing: 24))
        }
    }
}

struct ComparedScoreCard_Previews: PreviewProvider {
    static var previews: some View {
        ComparedScoreCard()
    }
}
