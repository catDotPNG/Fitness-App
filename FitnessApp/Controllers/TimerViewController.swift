//
//  TimerViewController.swift
//  FitnessApp
//
//  Created by corey on 2/15/21.
//

import Foundation
import UIKit
import AVKit

class TimerViewController: UIViewController {
    @IBOutlet weak var restTimerLabel: UILabel!
    var timer: Timer?
    var totalTime = 0
    var currentTime = 0
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading timer view")
        view.layer.cornerRadius = 15
    }
    
    @IBAction func stopTimerPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segues.dismissTimerSegue, sender: self)
    }
}
