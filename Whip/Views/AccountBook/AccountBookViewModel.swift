//
//  AccountBookViewModel.swift
//  Whip
//
//  Created by peo on 2022/06/26.
//

import SwiftUI

class AccountBookViewModel: ObservableObject {
    @Published var records = [
        TransactionItemModel(title: "모네 카페", kind: .pay, money: -4000),
        TransactionItemModel(title: "(주)포애퍼", kind: .income, money: 2000000),
        TransactionItemModel(title: "이규환", kind: .pay, money: -7000),
        TransactionItemModel(title: "심명진", kind: .income, money: 8000),
        TransactionItemModel(title: "박건호", kind: .pay, money: -7000),
    ]
    @Published var currentDate = Date()
    @Published var titleMoney = "18,000원"
    @Published var progressPercentage: Float = 0.4
    @Published var progressMoney = "34,000원"
    @Published var progressCurrentDate = "6월 26일"
    
    func change() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd"
        
        let anotherDF = DateFormatter()
        anotherDF.dateFormat = "M월 dd일"
        anotherDF.locale = Locale(identifier: "ko_KR")
        withAnimation {
            switch dateFormatter.string(from: self.currentDate) {
            case "06 26":
                self.records = [
                    TransactionItemModel(title: "모네 카페", kind: .pay, money: -4000),
                    TransactionItemModel(title: "(주)포애퍼", kind: .income, money: 2000000),
                    TransactionItemModel(title: "이규환", kind: .pay, money: -7000),
                    TransactionItemModel(title: "심명진", kind: .income, money: 8000),
                    TransactionItemModel(title: "박건호", kind: .pay, money: -7000),
                ]
                self.titleMoney = "18,000원"
                self.progressPercentage = 0.4
                self.progressMoney = "34,000원"
            case "06 22":
                self.records = [
                    TransactionItemModel(title: "포항공과대학교 복지회", kind: .pay, money: -6300),
                    TransactionItemModel(title: "네이버 페이", kind: .pay, money: -11552),
                    TransactionItemModel(title: "카카오 페이", kind: .pay, money: -7739),
                ]
                self.titleMoney = "25,591원"
                self.progressPercentage = 0.34
                self.progressMoney = "26,409원"
            case "06 21":
                self.records = [
                    TransactionItemModel(title: "카카오 페이", kind: .pay, money: -10000),
                    TransactionItemModel(title: "한국철도공사", kind: .pay, money: -122305),
                    TransactionItemModel(title: "GS25 포스텍지곡회관", kind: .pay, money: -3960),
                    TransactionItemModel(title: "토스 이규환", kind: .income, money: 997699),
                    TransactionItemModel(title: "포항공과대학교 복지회", kind: .pay, money: -5500),
                    TransactionItemModel(title: "이필섭", kind: .income, money: 500000),
                    TransactionItemModel(title: "포항공과대학교 복지회", kind: .pay, money: -5500),
                ]
                self.titleMoney = "147,265원"
                self.progressPercentage = 0.9
                self.progressMoney = "119,265원"
            default :
                self.records = []
                self.titleMoney = "18,000원"
                self.progressPercentage = 0.4
                self.progressMoney = "34,000원"
            }
            self.progressCurrentDate = anotherDF.string(from: self.currentDate)
        }
    }
}
