//
//  DatePickerController.swift
//  loginProject
//
//  Created by Ground 2 on 28/03/24.
//

import UIKit

class DatePickerController: UIViewController, UICalendarSelectionSingleDateDelegate{
    
    let disbaledDates = [10 , 26, 16
    ]
    
    let enabledDay = ["02","04", "07"]
    
    
    var calendar = UICalendarView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Specify the ending date.
        let toDateComponents = DateComponents(
            calendar: .current,
            year: 2024,
            month: 12,
            day: 31
        )
        
        calendar.bounds = view.bounds
        calendar.center = view.center
        
        let calendarRange = DateInterval(start: Date(), end: toDateComponents.date! )
        calendar.availableDateRange = calendarRange
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendar.selectionBehavior = dateSelection
        
        
        calendar.delegate = self
        
        
        view.addSubview(calendar)
        
    }

}

extension DatePickerController: UICalendarViewDelegate {
    
    
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print(dateComponents!.day)
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: dateComponents!.date!)
        
        return enabledDay.contains(String(format: "%02d", weekDay))
        
//        if(disbaledDates.contains(dateComponents!.day!)){
//            return false
//        }
        
        // return true
                
    }
    
}
