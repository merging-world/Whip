//
//  DailyView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI

struct DailyView: View {
    @State var isFullScreenOver = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("전체 내역")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                
                Spacer()
                Text("+ 영수증으로 내역 추가")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .onTapGesture {
                        self.isFullScreenOver = true
                    }
                    .fullScreenCover(isPresented: self.$isFullScreenOver) {
                        OCRView(isOnOCRView: self.$isFullScreenOver)
                    }
                    .foregroundColor(.blueGray)
            }
            .font(.system(size: 14))
            .padding(.top, 16)
            
            HStack(spacing: 0) {
                Text("26일 일요일")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Spacer()
            }
            .font(.system(size: 16))
            .padding(.top, 24)
            
            Divider()
                .padding(.top, 16)
                .padding(.bottom, 20)
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
