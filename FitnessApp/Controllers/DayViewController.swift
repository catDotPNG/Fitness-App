//
//  ViewController.swift
//  FitnessApp
//
//  Created by corey on 2/13/21.
//

import UIKit

class DayViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var workoutDays: [WorkoutDay] = []
    var selectedDay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadDays()
    }
    
    func loadDays() {
        //print("Loading workout days...")
        // make this load from firestore or something later
        workoutDays = getDays()
    }


}

//MARK: - UITableViewDataSource

extension DayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let day = workoutDays[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! DayTableViewCell
        cell.dayLabel.text = day.name
        //print("Adding cell for \(day.name)")
        return cell
    }
}

//MARK: - UITableViewDelegate
extension DayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDay = indexPath.row
        self.performSegue(withIdentifier: K.Segues.daysToExerciseSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let exerciseViewController = segue.destination as! ExerciseViewController
        
        exerciseViewController.exercisesForDay = workoutDays[selectedDay]
    }
}

extension DayViewController {
    func getDays() -> [WorkoutDay] {
        let days = [
            WorkoutDay(name: K.DaysOfWeek.monday, exercises: [Exercise(name: "bench", currentMax: 185.0, reps: 5, sets: 3), Exercise(name: "overhead", currentMax: 100.0, reps: 10, sets: 5)]),
            WorkoutDay(name: K.DaysOfWeek.tuesday, exercises: nil),
            WorkoutDay(name: K.DaysOfWeek.wednesday, exercises: nil),
            WorkoutDay(name: K.DaysOfWeek.thursday, exercises: nil),
            WorkoutDay(name: K.DaysOfWeek.friday, exercises: nil),
            WorkoutDay(name: K.DaysOfWeek.saturday, exercises: nil)
        ]
        return days
    }
}
