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
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
