//
//  ContentView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct BaseView: View {
    @State var mode: BaseViewMode = .main
    
    var body: some View {
        VStack {
            Spacer()
            
            self.mode.view
            
            Spacer()
            
            BaseViewTabBar(mode: self.$mode)
        }
    }
}

enum BaseViewMode {
    case main
    case schedule
    case myProfile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:
            MainView()
        case .schedule:
            ScheduleView()
        case .myProfile:
            MyProfileView()
        }
    }
    
    var tabBarIconImageName: String {
        switch self {
        case .main:
            return "house.fill"
        case .schedule:
            return "note.text.badge.plus"
        case .myProfile:
            return "person.fill"
        }
    }
    var tabBarLabelText: String {
        switch self {
        case .main:
            return "분석"
        case .schedule:
            return "가계부"
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
