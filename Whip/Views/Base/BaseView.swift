//
//  ContentView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct BaseView: View {
    @State var mode: BaseViewMode = .analysis
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Spacer()
                
                self.mode.view
                
                BaseViewTabBar(mode: self.$mode)
                    .frame(
                        maxWidth: Const.View.Base.Tabbar.width,
                        maxHeight: Const.View.Base.Tabbar.height - proxy.safeAreaInsets.bottom
                    )
                    .padding(.top, 16)
                    .padding(.bottom, 4)
                    .background(Color.card)
                    .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 0)
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

enum BaseViewMode {
    case analysis
    case accountBook
    case challenge
    case myProfile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .analysis:
            AnaylsisView()
        case .accountBook:
            AccountBookView()
        case .challenge:
            ChallengeView()
        case .myProfile:
            MyProfileView()
        }
    }
    
    var tabBarIconImageName: String {
        switch self {
        case .analysis:
            return "home"
        case .accountBook:
            return "account"
        case .challenge:
            return "award"
        case .myProfile:
            return "user"
        }
    }
    var tabBarLabelText: String {
        switch self {
        case .analysis:
            return "홈"
        case .accountBook:
            return "가계부"
        case .challenge:
            return "챌린지"
        case .myProfile:
            return "마이"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
