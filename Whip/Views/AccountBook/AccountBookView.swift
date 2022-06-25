//
//  ScheduleView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct AccountBookView: View {
    @State private var mode: AccountBookViewMode = .daily
    @State var showModal = false
    @StateObject var viewModel = CameraViewModel()
    @State var selectedIndex = 0
    @StateObject var accountbookViewModel = AccountBookViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        self.toolbar()
                            .padding(.top, 52)
                            .padding(.horizontal, 24)
                        
                        ProgressView(abViewModel: self.accountbookViewModel)
                            .padding(.horizontal, 24)
                            .padding(.top, 20)
                        
                        CustomDivider()
                            .padding(.top, 24)
                        
                        self.mode.calenderView(date: self.$accountbookViewModel.currentDate, toolbarTitle: self.$viewModel.model.resultText, abViewModel: self.accountbookViewModel)
                            .padding(.top, self.mode == .daily ? 24 : 0)
                        
                        
                        ForEach(0..<self.accountbookViewModel.records.count, id: \.self) { index in
                                TransactionItem(model: self.accountbookViewModel.records[index])
                                .padding(.vertical, 12)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    self.selectedIndex = index
                                    self.showModal = true
                                }
                        }
                        .padding(.horizontal, 24)
                        .offset(y: self.mode == .weekly ? -230 : 0)
                        .padding(.top, 4)
                        .sheet(isPresented: self.$showModal) {
                            ItemDetailView(
                                showModal: self.$showModal,
                                viewModel: self.viewModel,
                                model: self.accountbookViewModel.records[self.selectedIndex]
                            )
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, self.mode == .weekly ? 0 : 40)
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
    func toolbar() -> some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(self.viewModel.model.resultText)
                    .font(.system(size: 20, weight: .medium))
                
                Text(self.accountbookViewModel.titleMoney)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.fontColor)
                    .padding(.top, 8)
            }
            
            Spacer()
            
            NavigationLink(destination: {
                DetailedAnaylsisView()
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
    func calenderView(date: Binding<Date>, toolbarTitle: Binding<String>, abViewModel: AccountBookViewModel) -> some View {
        switch self {
        case .daily:
            DailyView()
                .frame(width: UIScreen.main.bounds.width - 48)
                .onAppear {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "M월 dd일"
                    dateFormatter.locale = Locale(identifier:"ko_KR")
                    toolbarTitle.wrappedValue = dateFormatter.string(from: Date())
                }
        case .weekly:
            CalendarView(scope: .week, date: date, toolbarTitle: toolbarTitle, abViewModel: abViewModel)
                .frame(
                    width: UIScreen.main.bounds.width - 48,
                    height: UIScreen.main.bounds.height / 2.5
                )
        case .monthly:
            CalendarView(scope: .month, date: date, toolbarTitle: toolbarTitle, abViewModel: abViewModel)
                .frame(
                    width: UIScreen.main.bounds.width - 48,
                    height: UIScreen.main.bounds.height / 2.5
                )
        }
    }
    
    var totalMoney: String {
        switch self {
        case .daily:
            return "12,500원"
        case .weekly:
            return "83,400원"
        case .monthly:
            return "324,000원"
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
