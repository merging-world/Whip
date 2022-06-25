//
//  TipDetailView.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct TipDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let oneDaySemina = Text("원데이 세미나").foregroundColor(Color.carrot)
    
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
                .padding([.top, .bottom], 16)
                Spacer()
            }
            .background(Color.carrot)
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("하루를 의미있게,\n원데이 세미나")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                Text("오늘의 당근팁")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white.opacity(0.7))
                            }
                            Spacer()
                            Image("Carrot")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 180)
                                .padding(.bottom, -70)
                        }
                        .padding(24)
                        .background(Color.carrot)
                        .offset(x: 0, y: self.getOffsetY(basedOn: geo) + 100)
                    }
                    // Need this to make sure the geometryreader has a size
                    .scaledToFill()
                    .frame(height: 140)
                    HStack {
                        Text("규환님의 커리어를 위한\n\(self.oneDaySemina)들을 찾아왔어요")
                            .font(.system(size: 18))
                        Spacer()
                    }
                    .padding(24)
                    VStack(spacing: 16) {
                        ForEach(contents2, id: \.self) { item in
                            TipLinkCard(tipContent: item)
                        }
                    }
                    .padding([.leading, .trailing], 24)
                    .padding(.bottom, 32)
                    .background(Color.white)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct TipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TipDetailView()
    }
}
