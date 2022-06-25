//
//  DetailedAnaylsisView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct DetailedAnaylsisView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let donutChartMostTitle = Text("당근 챌린지").foregroundColor(.carrot)
    private let consumerText = Text("소비 패턴").bold().foregroundColor(.whip)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color.white)
                            .font(.system(size: 24))
                    }
                    .padding(.leading, 24)
                    .padding([.top, .bottom], 16)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("주간 소비 데이터")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                    Spacer()
                }
            }
            .background(Color.whip)
            
            ScrollView {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("평균 주간 소비 금액")
                                .font(.system(size: 18))
                                
                            Text("200,000 원")
                                .font(.system(size: 24))
                                .bold()
                                .padding(.top, 12)
                            
                            Text("지난 주 대비 -7,000원")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .padding(.top, 12)
                        }
                        self.barChartView
                            .padding(.top, 20)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 24)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("지금까지 \(self.donutChartMostTitle)에\n가장 많은 돈을 쓰셨군요!")
                            .font(.system(size: 18))
                            .lineSpacing(2)
                        self.donutChartView
                            .padding(.top, 16)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 48)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("이규환님의 \(self.consumerText)에 맞춘 챌린지 추천")
                                .font(.system(size: 18))
                            Spacer()
                        }
                        
                        TipLinkCard(tipContent: TipContent(title: "스스로 성장하는\n분석가 커리어 만들기", image: "sample1"), isDetailedAnalysis: true)
                            .padding(.top, 20)
                        
                        Button(action: {
                            
                        }) {
                            Text("추천 챌린지 도전하기")
                                .bold()
                        }
                        .buttonStyle(BigButtonStyle(fontSize: 18, fontColor: .white, backgroundColor: .carrot))
                        .padding(.top, 20)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 48)
                    .padding(.bottom, 60)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

extension DetailedAnaylsisView {
    @ViewBuilder
    var barChartView: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("(만원)")
                    .font(.system(size: 14))
                Spacer()
            }
            BarChartView()
                .padding(.top, 20)
        }
        .frame(width: 280, height: 180)
        .padding(.horizontal, 40)
        .padding(.top, 28)
        .padding(.bottom, 16)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.08), radius: 26, x: 0, y: 0)
    }
    
    @ViewBuilder
    var donutChartView: some View {
        VStack {
            HStack {
                Spacer()
                Text("2022.01 ~ 현재")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            DonutChartView(
                values: [300000, 189000, 45000],
                names: ["당근챌린지", "인터넷 강의", "서점"],
                widthFraction: 0.95
            )
        }
        .frame(width: 280, height: 380)
        .padding(.horizontal, 40)
        .padding(.top, 36)
        .padding(.bottom, 20)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.08), radius: 26, x: 0, y: 0)
        
    }
}

struct DetailedAnaylsisView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedAnaylsisView()
    }
}
