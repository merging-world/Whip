//
//  BarChartView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct BarChartView: View {
    let maxPrice = 3
    var weekdayText = ["월", "화", "수", "목", "금", "토", "일"]
    var value: [CGFloat] = [118, 76, 68, 42, 120, 100, 140]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<4, id: \.self) { index in
                    HStack(spacing: 0) {
                        Text(String(format: "%.1f", Double(3 - index)))
                            .font(.system(size: 14))
                            .foregroundColor(.darkGray)
                        
                        CustomDivider(height: 1, horizontalPadding: 76)
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 24)
                }
            }
            
            HStack(alignment: .bottom) {
                ForEach(0..<7, id: \.self) { index in
                    VStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.whip)
                            .frame(width: 14, height: self.value[index])
                        
                        Text("\(self.weekdayText[index])")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.blueGray)
                    }
                    .padding(.leading, 10)
                }
            }
            .padding(.leading, 44)
            .padding(.bottom, 14)
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
