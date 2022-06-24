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
            VStack {
                Spacer()
                
                self.mode.view
                
                BaseViewTabBar(mode: self.$mode)
                    .frame(
                        maxWidth: Const.View.Base.Tabbar.width,
                        maxHeight: Const.View.Base.Tabbar.height - proxy.safeAreaInsets.bottom
                    )
                    .offset(y: 8)
            }
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
            return "chart.pie.fill"
        case .accountBook:
            return "note.text.badge.plus"
        case .challenge:
            return "lightbulb.fill"
        case .myProfile:
            return "person.fill"
        }
    }
    var tabBarLabelText: String {
        switch self {
        case .analysis:
            return "분석"
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
