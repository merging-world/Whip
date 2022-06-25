//
//  CalendarView.swift
//  Whip
//
//  Created by peo on 2022/06/24.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    
    var scope: FSCalendarScope
    @Binding var date: Date
    @Binding var toolbarTitle: String
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.scope = self.scope
        
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerTitleColor = UIColor(.fontColor)
        calendar.appearance.weekdayTextColor = UIColor(.weekdayColor)
        
        calendar.appearance.titleDefaultColor = UIColor(.calendarText)  // 평일
        calendar.appearance.titleWeekendColor = UIColor(.calendarText)    // 주말
        calendar.appearance.selectionColor = UIColor(.whip)
        calendar.appearance.subtitlePlaceholderColor = UIColor(.subtitlePlaceholder)
        
        calendar.appearance.titleFont = .boldSystemFont(ofSize: 13)
        calendar.appearance.weekdayFont = .boldSystemFont(ofSize: 15)
        calendar.appearance.headerTitleFont = .boldSystemFont(ofSize: 17)
        
        if self.scope == .week {
            calendar.headerHeight = 28
            calendar.appearance.headerTitleFont = .boldSystemFont(ofSize: 0)
            calendar.appearance.titleFont = .boldSystemFont(ofSize: 17)
        } else {
            calendar.headerHeight = UIScreen.main.bounds.height / 11.0
        }
        calendar.select(Date())
        
        let currentPageDate = self.date
        let month = Calendar.current.component(.month, from: currentPageDate)
        let week = Calendar.current.component(.weekOfMonth, from: currentPageDate)
        
        switch self.scope {
        case .week:
            self.toolbarTitle = "\(month)월 \(week)주"
        case .month:
            self.toolbarTitle = "\(month)월"
        default :
            self.toolbarTitle = ""
        }
        
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        uiView.appearance.todayColor = .white
        uiView.appearance.titleTodayColor = UIColor(.calendarText)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        private let calendarView: CalendarView
        
        init(_ calendarView: CalendarView) {
            self.calendarView = calendarView
        }
        
        // 날짜 선택 시 콜백 메소드
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            self.calendarView.date = date
        }
        
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            let currentPageDate = calendar.currentPage
            let month = Calendar.current.component(.month, from: currentPageDate)
            let week = Calendar.current.component(.weekOfMonth, from: currentPageDate)
            
            switch calendar.scope {
            case .week:
                self.calendarView.toolbarTitle = "\(month)월 \(week)주"
            case .month:
                self.calendarView.toolbarTitle = "\(month)월"
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(scope: .week, date: .constant(Date()), toolbarTitle: .constant(""))
    }
}
