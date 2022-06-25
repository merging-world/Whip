//
//  ScheduleView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct AccountBookView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().backgroundColor = .white
    }
    @State private var mode: AccountBookViewMode = .daily
    
    @State var records = ["Digi", "Steve", "Hwana", "Jessica", "Bean"]
    @State var date = Date() {
        didSet {
            print(self.date)
        }
    }
    @State var showModal = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        self.toolbar()
                            .padding(.top, 12)
                        
                        self.mode.calenderView(date: self.$date)
                            .padding(.top, self.mode == .daily ? 24 : 0)
                        
                        CustomDivider(height: 1, horizontalPadding: 24)
                            .offset(y: self.mode == .weekly ? -240 : 0)
                            .padding(.top, 12)
                        
                        ForEach(self.records, id: \.self) {
                            if self.mode == .weekly || self.mode == .daily {
                                TransactionItem(
                                    title: $0,
                                    description: self.date.formatted(),
                                    price: 1000 * $0.count
                                )
                                .padding(.vertical, 12)
                                .onTapGesture {
                                    self.showModal = true
                                }
                                
                            } else {
                                VStack(spacing: 0) {
                                    MonthlyTransactionItem()
                                        .onTapGesture {
                                            self.showModal = true
                                        }
                                    
                                    CustomDivider(height: 1, horizontalPadding: 24)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .offset(y: self.mode == .weekly ? -230 : 0)
                        .padding(.top, 4)
                        .sheet(isPresented: self.$showModal) {
                            ItemDetailView(showModal: self.$showModal)
                        }
                        
                    }
                    .padding(.horizontal, 24)
                }
                
                VStack {
                    Spacer()
                    SegementedView(selectedMode: self.$mode)
                    .offset(y: -16)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

extension AccountBookView {
    @ViewBuilder
    func toolbar(date: Date = Date()) -> some View {
        HStack(spacing: 0) {
            Text("22")
                .font(.system(size: 44))
                .bold()
                .foregroundColor(.fontColor)
                
            VStack(alignment: .leading, spacing: 0) {
                Text("Wed")
                
                Text("June 2022")
                    .padding(.top, 6)
            }
            .font(.system(size: 14))
            .padding(.leading, 10)
            .foregroundColor(.gray)
            
            Spacer()
            
            NavigationLink(destination: {
//                DetailedAnaylsisView()
                OCRView()
            }) {
                Text("분석")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(Color(red: 141.0/255.0, green: 141.0/255.0, blue: 141.0/255.0))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color(red: 141.0/255.0, green: 141.0/255.0, blue: 141.0/255.0, opacity: 0.1))
                    .cornerRadius(8)
            }
        }
    }
}

enum AccountBookViewMode: String, CaseIterable {
    case daily = "일간"
    case weekly = "주간"
    case monthly = "월간"
    
    @ViewBuilder
    func calenderView(date: Binding<Date>) -> some View {
        switch self {
        case .daily:
            DailyView()
                .frame(width: UIScreen.main.bounds.width - 32)
        case .weekly:
            CalendarView(scope: .week, date: date)
                .frame(
                    width: UIScreen.main.bounds.width - 32,
                    height: UIScreen.main.bounds.height / 2.5
                )
        case .monthly:
            CalendarView(scope: .month, date: date)
                .frame(
                    width: UIScreen.main.bounds.width - 32,
                    height: UIScreen.main.bounds.height / 2.5
                )
        }
    }
    
    var index: Int {
        switch self {
        case .daily:
            return 0
        case .weekly:
            return 1
        case .monthly:
            return 2
        }
    }
}

struct AccountBookView_Previews: PreviewProvider {
    static var previews: some View {
        AccountBookView()
    }
}
