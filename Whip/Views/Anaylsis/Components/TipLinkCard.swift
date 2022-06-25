//
//  TipLinkCard.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/25.
//

import SwiftUI

struct TipLinkCard: View {
    let tipContent: TipContent
    
    var body: some View {
        Card(
            AnyView(
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(tipContent.title)
                                .font(.system(size: 16))
                            tipContent.desc != nil ? Text(tipContent.desc!)
                                .font(.system(size: 12))
                                .foregroundColor(Color.blueGray): nil
                        }
                        Spacer()
                        Text("바로가기")
                            .padding([.top, .bottom], 8)
                            .padding([.leading, .trailing], 24)
                            .foregroundColor(Color.white)
                            .background(Color.fontColor)
                            .cornerRadius(10)
                    }
                    .padding(16)
                    tipContent.image != nil ? Image(tipContent.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .clipped() : nil
                }
            ), color: nil, padding: 0
        )
    }
}

struct TipLinkCard_Previews: PreviewProvider {
    static var previews: some View {
        TipLinkCard(tipContent: TipContent(title: "스스로 성장하는\n분석가 커리어 만들기", image: "sample2"))
    }
}
