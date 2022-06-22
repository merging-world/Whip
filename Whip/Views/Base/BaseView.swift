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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
