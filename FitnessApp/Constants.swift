//
//  Constants.swift
//  FitnessApp
//
//  Created by corey on 2/13/21.
//

import Foundation

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "DayTableViewCell"
    static let appName = "🏋️ Fitness App"
    
    struct DaysOfWeek {
        static let monday = "Monday"
        static let tuesday = "Tuesday"
        static let wednesday = "Wednesday"
        static let thursday = "Thursday"
        static let friday = "Friday"
        static let saturday = "Saturday"
        static let sunday = "Sunday"
    }
    
    struct Segues {
        static let daysToExerciseSegue = "daysToExerciseSegue"
        static let restTimerSegue = "restTimerSegue"
        static let dismissTimerSegue = "dismissTimerSegue"
    }
}
