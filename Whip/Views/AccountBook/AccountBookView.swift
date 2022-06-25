//
//  ScheduleView.swift
//  Whip
//
//  Created by peo on 2022/06/22.
//

import SwiftUI

struct AccountBookView: View {
    @State private var mode: AccountBookViewMode = .daily
    @State var records = ["Digi", "Steve", "Hwana", "Jessica", "Bean"]
    @State var date = Date()
    @State var showModal = false
    @StateObject var viewModel = CameraViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        self.toolbar()
                            .padding(.top, 52)
                            .padding(.horizontal, 24)
                        
                        ProgressView()
                            .padding(.horizontal, 24)
                            .padding(.top, 20)
                        
                        CustomDivider()
                            .padding(.top, 24)
                        
                        self.mode.calenderView(date: self.$date, toolbarTitle: self.$viewModel.model.resultText)
                            .padding(.top, self.mode == .daily ? 24 : 0)
                        
                        
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
                        .padding(.horizontal, 24)
                        .offset(y: self.mode == .weekly ? -230 : 0)
                        .padding(.top, 4)
                        .sheet(isPresented: self.$showModal) {
                            ItemDetailView(showModal: self.$showModal, viewModel: self.viewModel)
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
    func toolbar() -> some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(self.viewModel.model.resultText)
                    Image(systemName: "chevron.down")
                }
                .font(.system(size: 20))
                
                Text("12,500원")
                    .font(.system(size: 32))
                    .bold()
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
    func calenderView(date: Binding<Date>, toolbarTitle: Binding<String>) -> some View {
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
            CalendarView(scope: .week, date: date, toolbarTitle: toolbarTitle)
                .frame(
                    width: UIScreen.main.bounds.width - 48,
                    height: UIScreen.main.bounds.height / 2.5
                )
        case .monthly:
            CalendarView(scope: .month, date: date, toolbarTitle: toolbarTitle)
                .frame(
                    width: UIScreen.main.bounds.width - 48,
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
