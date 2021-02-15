//
//  WorkoutCoach.swift
//  FitnessApp
//
//  Created by corey on 2/13/21.
//

import Foundation

struct WorkoutCoach {
    let exercises: [Exercise]?
    var restTimer: Int = 0
    
    init(_ exercises: [Exercise]) {
        self.exercises = exercises
        print("[COACH] Coach will now go through \(exercises.count) exercises.")
    }
    
    init() {
        exercises = nil
    }
    
    func getExercise(_ exerciseNumber: Int) -> Exercise {
        if let exercise = exercises {
            return exercise[exerciseNumber]
        }
        return Exercise(name: "badExercise", currentMax: 0.0, reps: 0, sets: 0)
    }
    
    func startRestTimer() {
        
    }
    
    func stopRestTimer() {
        
    }
}
