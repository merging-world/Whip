//
//  ProgressView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct ProgressView: View {
    let remainingBudgetPercent: Float = 0.7
    let moneyCount = Text("34,000원").bold().foregroundColor(.whip)
    
    var body: some View {
        Card(
            AnyView(
                VStack(spacing: 16) {
                    HStack {
                        Text("6월 24일에는 평소보다\n\(self.moneyCount) 적게 사용했어요")
                            .font(.system(size: 16))
                            .lineSpacing(4)
                        Spacer()
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.modernGray)
                                .frame(width: geo.size.width, height: 10)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.whip)
                                .frame(width: geo.size.width * CGFloat(self.remainingBudgetPercent), height: 10)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                                .offset(x: geo.size.width * CGFloat(self.remainingBudgetPercent) - 9)
                        }
                    }
                    
                }
            ),
            color: nil
        )
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
