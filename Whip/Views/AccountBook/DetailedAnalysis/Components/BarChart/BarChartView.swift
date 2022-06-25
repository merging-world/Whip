//
//  BarChartView.swift
//  Whip
//
//  Created by peo on 2022/06/25.
//

import SwiftUI

struct BarChartView: View {
    let maxPrice = 30
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<4, id: \.self) { index in
                    HStack(spacing: 0) {
                        Text("\(maxPrice - index * (maxPrice / 3))")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .frame(width: 20)
                        
                        VStack {
                            Divider()
                        }
                        .padding(.leading, 16)
                    }
                    .padding(.bottom, 24)
                }
            }
            
            HStack(alignment: .bottom) {
                ForEach(0..<7, id: \.self) { index in
                    VStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.whip)
                            .frame(width: 14, height: CGFloat(Int.random(in: 0...130)))
                        
                        Text("\(index)")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 12)
                }
            }
            .padding(.leading, 36)
//            .padding(.top, 4)
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
