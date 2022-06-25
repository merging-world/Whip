//
//  TipDetailView.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/24.
//

import SwiftUI

struct TipDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    let tip: Tip
    let desc: [String]
    var res: [Text] = []
    
    init(tip: Tip) {
        self.tip = tip
        desc = tip.desc.components(separatedBy: "'")
        
        for idx in 0..<desc.count {
            res.append(Text(desc[idx]).foregroundColor(idx % 2 == 0 ? Color.black : (tip.type == 0 ? Color.carrot : Color.whip)))
        }
    }
    
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
            .background(tip.type == 0 ? Color.carrot : Color.whip)
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(tip.detailTitle)
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                Text("오늘의 \(tip.type == 0 ? "당근" : "채찍")팁")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white.opacity(0.7))
                            }
                            Spacer()
                            Image(tip.type == 0 ? "Carrot" : "Whip")
                                .resizable()
                                .scaledToFit()
                                .frame(width: tip.type == 0 ? 90 : 200, height: tip.type == 0 ? 180 : 200)
                                .padding(.bottom, tip.type == 0 ? -70 : -100)
                                .padding(.trailing, tip.type == 0 ? 0 : -40)
                        }
                        .padding(24)
                        .background(tip.type == 0 ? Color.carrot : Color.whip)
                        .offset(x: 0, y: self.getOffsetY(basedOn: geo) + 100)
                    }
                    // Need this to make sure the geometryreader has a size
                    .scaledToFill()
                    .frame(height: 140)
                    HStack {
                        Text("\(res[0] + res[1] + res[2])")
                            .font(.system(size: 18))
                        Spacer()
                    }
                    .padding(.horizontal,24)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                    VStack(spacing: 16) {
                        ForEach(tip.content ?? [], id: \.self) { item in
                            TipLinkCard(tipContent: item)
                        }
                    }
                    .padding([.leading, .trailing], 24)
                    .padding(.bottom, 32)
                    .background(Color.white)
                    tip.linkTitle != nil ?
                    Button(action: {
                        print(tip.link ?? "nil")
                    }) {
                        Text(tip.linkTitle!)
                            .bold()
                    }
                    .buttonStyle(
                        BigButtonStyle(
                            fontSize: 18,
                            fontColor: .white,
                            backgroundColor: Color.fontColor
                        )
                    )
                    .padding(.horizontal, 24)
                    .padding(.vertical, 32)
                    : nil
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct TipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TipDetailView(tip:
                        Tip(title: "지역 화폐를 만들어보세요 💸",
                            detailTitle: "지역화폐 사용하고\n10% 아끼자",
                            desc: "규환님이 살고 계신 경기도의 경우\n'경기지역화폐'를 사용하면\n10% 환급을 받을 수 있습니다.",
                            type: 1,
                            content: [
                                TipContent(
                                    title: "지난 달 지역화폐\n가맹점에서 사용한 돈", desc: "231,000원", type: 1
                                ),
                                TipContent(
                                    title: "지난 달 지역화폐를 사용했으면\n아낄 수 있었던 돈", desc: "231,00원", type: 2
                                )
                            ],
                            link: "https://google.com", linkTitle: "지역화폐 신청하러 가기"
                           )
        )
    }
}
