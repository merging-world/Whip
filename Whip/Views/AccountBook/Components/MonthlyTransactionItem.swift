//
//  MonthlyTransactionItem.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct MonthlyTransactionItem: View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 3, height: 60)
                .foregroundColor(.carrot)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("박건호")
                    .bold()
                
                Text("계좌이체")
                    .padding(.top, 6)
            }
            .font(.system(size: 13))
            .padding(.leading, 16)
            
            Text("-3,000원")
                .padding(.leading, 36)
            Spacer()
        }
    }
}

struct MonthlyTransactionItem_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyTransactionItem()
    }
}
