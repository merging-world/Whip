//
//  TransactionItem.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/23.
//

import SwiftUI

struct TransactionItem: View {
    let title: String
    let description: String
    let price: Int
    let formatter = NumberFormatter()
    
    init(title: String, description: String, price: Int) {
        self.title = title
        self.description = description
        self.price = price
        formatter.numberStyle = .decimal
    }
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                // TODO: 아이콘 변경하기
                Text("ㅋ")
            }
            .frame(width: 42, height: 42, alignment: .center)
            .background(Color.gray)
            .cornerRadius(21)
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Text("\(formatter.string(for: price)!)원")
                .font(.system(size: 16, weight: .semibold))
            
        }.padding()
    }
}

struct TransactionItem_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItem(title: "모네 카페", description: "내계좌이체 | 보통예금", price: -4000)
    }
}
