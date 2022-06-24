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
        HStack(alignment: .top, spacing: 0) {
            self.makeTabItem(mode: .analysis)
            
            Spacer()
            self.makeTabItem(mode: .accountBook)
            
            Spacer()
            self.makeTabItem(mode: .challenge)
            
            Spacer()
            self.makeTabItem(mode: .myProfile)
        }
        .padding(.horizontal, 35)
    }
}

// MARK: - Tab Item
extension BaseViewTabBar {
    @ViewBuilder
    private func makeTabItem(mode: BaseViewMode) -> some View {
        VStack(spacing: Const.View.Base.Tabbar.spacingBetweenIconAndLabel) {
            Image(systemName: mode.tabBarIconImageName)
                .resizable()
                .frame(
                    width: Const.View.Base.Tabbar.iconWidth,
                    height: Const.View.Base.Tabbar.iconHeight
                )
            
            Text(mode.tabBarLabelText)
                .font(.system(size: Const.View.Base.Tabbar.labelSize))
        }
        .foregroundColor(self.mode == mode ? .tabBarAccentColor : .secondary)
        .onTapGesture {
            self.mode = mode
        }
    }
}

struct BaseViewTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BaseViewTabBar(mode: .constant(.analysis))
    }
}
