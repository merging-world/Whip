//
//  BaseViewTabBar.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct BaseViewTabBar: View {
    @Binding var mode: BaseViewMode
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    self.mode = .main
                }
            Rectangle()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    self.mode = .schedule
                }
            Rectangle()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    self.mode = .myProfile
                }
        }
        .frame(maxWidth: .infinity, maxHeight: 83)
        .background(.gray)
    }
}

struct BaseViewTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BaseViewTabBar(mode: .constant(.main))
    }
}
