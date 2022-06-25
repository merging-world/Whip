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
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(scope: .week, date: .constant(Date()))
    }
}
