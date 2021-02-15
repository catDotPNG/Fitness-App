//
//  ExerciseViewController.swift
//  FitnessApp
//
//  Created by corey on 2/13/21.
//

import UIKit


class ExerciseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var exercisesForDay = WorkoutDay(name: "default", exercises: nil)
    var workoutCoach = WorkoutCoach()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print("[EXERCISE] Today's exercise is for \(exercisesForDay.name).")
        navigationItem.title = exercisesForDay.name
        navigationItem.backButtonTitle = "Back"
        
        tableView.register(HostingTableViewCell<ExerciseView>.self, forCellReuseIdentifier: "setCell")
        tableView.dataSource = self

        
        if let exercises = exercisesForDay.exercises {
            self.workoutCoach = WorkoutCoach(exercises)
        }
        
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
    }
}

//MARK: - UITableViewDelegate
extension ExerciseViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ExerciseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("numberOfRowsInSection: \(workoutCoach.exercises?.count ?? 0)")
        return workoutCoach.exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! HostingTableViewCell<ExerciseView>
        let exercise = workoutCoach.getExercise(indexPath.row)
        cell.delegate = self
        cell.host(ExerciseView(exerciseName: exercise.name, sets: exercise.sets, reps: exercise.reps), parent: self)
        //print("cellForRowAt")
        return cell
    }
    
    
}

//MARK: - HostingCellProtocol
extension ExerciseViewController: HostingCellProtocol {
    func startRest() {
        performSegue(withIdentifier: K.Segues.restTimerSegue, sender: self)
    }
}
