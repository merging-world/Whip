//
//  ChallengeDetailView.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

import SwiftUI

struct ChallengeDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let challenge: Challenge
    
    init(_ challenge: Challenge) {
        self.challenge = challenge
    }
    
    @State var goSuccessView = false
    
    let contents: [TipContent] = [
        TipContent(title: "스스로 성장하는\n분석가 커리어 만들기", image: "sample1"),
        TipContent(title: "SQL로 시작하는\n데이터 분석", image: "sample2")
    ]
    let contents2: [TipContent] = [
        TipContent(title: "빅데이터 분석기사"),
        TipContent(title: "ADsP (데이터분석 준전문가)"),
        TipContent(title: "DAP (데이터아키텍처 전문가"),
        TipContent(title: "SQLP (SQL 준전문가)")
    ]
    let contents3: [TipContent] = [
        TipContent(title: "KT&G 장학재단", desc: "7월 12일 ~ 8월 1일"),
        TipContent(title: "STX 장학재단", desc: "7월 20일 ~ 8월 5일")
    ]
    
    func getOffsetY(basedOn geo: GeometryProxy) -> CGFloat {
        // Find Y position
        let minY = geo.frame(in: .global).minY
        
        let emptySpaceAboveSheet: CGFloat = -25
        
        // Don't offset view when scrolling down
        if minY <= emptySpaceAboveSheet {
            return 0
        }
        
        // Offset the view when it goes above to simulate it standing still
        return -minY + emptySpaceAboveSheet
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.white)
                        .font(.system(size: 24))
                }
                .padding(.leading, 24)
                .padding(.vertical, 16)
                Spacer()
            }
            .background(challenge.color)
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        HStack {
                            Spacer()
                            VStack(alignment: .center, spacing: 8) {
                                Text(challenge.title)
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 10)
                                Text(challenge.desc)
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white.opacity(0.7))
                                Image(challenge.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding(.top, 20)
                                    .padding(.bottom, -70)
                            }
                            Spacer()
                        }
                        .padding(24)
                        .background(challenge.color)
                        .offset(x: 0, y: self.getOffsetY(basedOn: geo) + 100)
                    }
                    // Need this to make sure the geometryreader has a size
                    .scaledToFill()
                    .frame(height: 140)
                    HStack(spacing: 24) {
                        Card(
                            AnyView(
                                HStack {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("진행률")
                                            .font(.system(size: 18))
                                        Text("\(Int(challenge.percent * 100))%")
                                            .font(.system(size: 28))
                                            .fontWeight(.bold)
                                            .foregroundColor(challenge.color)
                                    }
                                    Spacer()
                                }
                            ),
                            color: nil
                        )
                        Card(
                            AnyView(
                                HStack {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("남은 시간")
                                            .font(.system(size: 18))
                                        Text("15일")
                                            .font(.system(size: 28))
                                            .fontWeight(.bold)
                                            .foregroundColor(challenge.color)
                                    }
                                    Spacer()
                                }
                            ),
                            color: nil
                        )

                    }
                    .padding(24)
                    .padding(.top, 30)
                    Card(
                        AnyView(
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("챌린지를  달성하지 못해도 괜찮아요!\n매일 꾸준히 실천하려고 노력하는 것이 중요하답니다.")
                                        .font(.system(size: 18))
                                }
                                Spacer()
                            }
                            .padding(.bottom, 30)
                        ),
                        color: nil
                    )
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                    NavigationLink(destination: ChallengeSuccessView(), isActive: $goSuccessView) {
                        Button(action: {
                            self.goSuccessView = true
                        }) {
                            Text("챌린지 수행하기")
                                .bold()
                        }
                        .buttonStyle(
                            BigButtonStyle(
                                fontSize: 20,
                                fontColor: .white,
                                backgroundColor: challenge.color
                            )
                        )
                        .padding(.horizontal, 24)
                        .padding(.vertical, 32)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(Challenge(title: "하루에 천원 저축하기", desc: "30일 챌린지", content: "15,000원", percent: 0.7, color: Color.whip, image: "Piggy"))
    }
}
