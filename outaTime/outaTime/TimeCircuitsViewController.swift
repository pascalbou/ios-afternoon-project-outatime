//
//  TimeCircuitsViewController.swift
//  outaTime
//
//  Created by krikaz on 3/5/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var DestinationTimeLabel: UILabel!
    @IBOutlet weak var PresentTimeLabel: UILabel!
    @IBOutlet weak var LastTimeLabel: UILabel!
    @IBOutlet weak var SpeedLabel: UILabel!
    

    @IBOutlet weak var SetButton: UIButton!
    @IBAction func BackButton(_ sender: UIButton) {
        startTimer()
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }
    
    var speed: Int = 0
    var timer: Timer? = nil
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
//        speed = 0
//        SpeedLabel.text = String(speed) + " MPH"
    }
    
    func resetTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            SpeedLabel.text = String(speed) + " MPH"
        } else {
            LastTimeLabel.text = PresentTimeLabel.text
            PresentTimeLabel.text = DestinationTimeLabel.text
            speed = 0
//            SpeedLabel.text = String(speed) + " MPH"
            resetTimer()
            
            let alert = UIAlertController(title: "Time Travel Succesful", message: "Your new date is \(PresentTimeLabel.text)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentTime = Date()
        PresentTimeLabel.text = "\(dateFormatter.string(from: currentTime))"
        LastTimeLabel.text = "--- -- ----"
        
        SpeedLabel.text = String(speed) + " MPH"
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let destinationVC = segue.destination as? DatePickerViewController {
                destinationVC.delegate = self
            }
        }
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        DestinationTimeLabel.text = "\(dateFormatter.string(from: date))"
    }
    
    
}
