//
//  DailyView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct DailyView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("지출")
                        .font(.system(size: 12))
                        .foregroundColor(.fontColor)
                    
                    Text("24,552원")
                        .font(.system(size: 16))
                        .foregroundColor(.whip)
                        .padding(.leading, 12)
                    Spacer()
                }
                HStack(spacing: 0) {
                    Text("수입")
                        .font(.system(size: 12))
                        .foregroundColor(.fontColor)
                    
                    Text("24,552원")
                        .font(.system(size: 16))
                        .foregroundColor(.carrot)
                        .padding(.leading, 12)
                    Spacer()
                }
                .padding(.top, 12)
            }
            
            HStack(spacing: 0) {
                Text("전체 내역")
                Spacer()
                Text("+ 내역 추가")
            }
            .font(.system(size: 14))
            .padding(.top, 24)
            
            HStack(spacing: 0) {
                Text("28일 월요일")
                Spacer()
                Text("+92,233원")
                    .foregroundColor(.carrot)
                    .padding(.leading, 12)
                Text("-192,233원")
                    .foregroundColor(.whip)
            }
            .font(.system(size: 16))
            .padding(.top, 24)
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
