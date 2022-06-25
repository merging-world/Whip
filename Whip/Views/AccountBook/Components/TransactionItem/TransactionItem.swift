//
//  TransactionItem.swift
//  Whip
//
//  Created by 박원빈 on 2022/06/23.
//

import SwiftUI

struct TransactionItem: View {
    var model: TransactionItemModel
    let formatter = NumberFormatter()
    let moneyText: String
    
    init(model: TransactionItemModel) {
        self.model = model
        self.formatter.numberStyle = .decimal
        self.moneyText = (model.money > 0 ? "+" : "")  + formatter.string(for: self.model.money)!
    }
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Image(systemName: "arrow.left.arrow.right")
                    .foregroundColor(self.model.kind.color)
            }
            .frame(width: 42, height: 42, alignment: .center)
            .background(self.model.kind.halfColor)
            .cornerRadius(21)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(self.model.title)
                    .font(.system(size: 16, weight: .semibold))
                Text(self.model.kind.rawValue)
                    .font(.system(size: 12))
                    .foregroundColor(Color.darkGray)
                    .fontWeight(.medium)
            }
            Spacer()
            
            Text("\(self.moneyText)원")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(self.model.kind.color)
            
        }
    }
}

struct TransactionItem_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItem(model: TransactionItemModel(title: "", kind: .pay, money: 0))
    }
}
