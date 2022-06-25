//
//  DetailedAnaylsisView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct DetailedAnaylsisView: View {
    private let donutChartMostTitle = Text("당근 챌린지").foregroundColor(.carrot)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("평균 주간 소비 금액")
                            .font(.system(size: 18))
                            
                        Text("총 200,000 원")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.top, 12)
                        
                        Text("지난 주 대비 -7,000원")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .padding(.top, 12)
                    }
                    self.barChartView
                        .padding(.top, 18)
                }
                .padding(.horizontal, 12)
                .padding(.top, 24)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(self.donutChartMostTitle)에\n가장 많은 돈을 쓰셨군요!")
                        .font(.system(size: 18))
                    self.donutChartView
                        .padding(.top, 12)
                }
                .padding(.horizontal, 12)
                .padding(.top, 48)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("이런 소비는 어떠세요?")
                            .font(.system(size: 18))
                        Spacer()
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 48)
                .padding(.bottom, 60)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
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
                .padding(.top, 16)
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
        DonutChartView(
            values: [300000, 189000, 45000],
            names: ["당근챌린지", "인터넷 강의", "서점"],
            widthFraction: 0.95
        )
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
