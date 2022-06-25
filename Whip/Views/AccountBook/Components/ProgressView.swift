//
//  ProgressView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct ProgressView: View {
    @ObservedObject var abViewModel: AccountBookViewModel
    
    var body: some View {
        Card(
            AnyView(
                VStack(spacing: 16) {
                    HStack {
                        Text(self.abViewModel.titleMoney == "147,265원" ? "\(self.abViewModel.progressCurrentDate)에는 평소보다\n\(Text(self.abViewModel.progressMoney).bold().foregroundColor(.carrot)) 많게 사용했어요" : "\(self.abViewModel.progressCurrentDate)에는 평소보다\n\(Text(self.abViewModel.progressMoney).bold().foregroundColor(.whip)) 적게 사용했어요")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .lineSpacing(4)
                        Spacer()
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.modernGray)
                                .frame(width: geo.size.width, height: 10)
                            RoundedRectangle(cornerRadius: 5)
                                .fill(self.abViewModel.titleMoney == "147,265원" ? Color.carrot : Color.whip)
                                .frame(width: geo.size.width * CGFloat(self.abViewModel.progressPercentage), height: 10)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                                .offset(x: geo.size.width * CGFloat(self.abViewModel.progressPercentage) - 9)
                        }
                    }
                    
                }
            ),
            color: nil
        )
    }
}
