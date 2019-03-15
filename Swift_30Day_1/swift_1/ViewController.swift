//
//  ViewController.swift
//  swift_1
//
//  Created by ZhangYi on 2019/2/18.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer: DispatchSourceTimer?
    var isTiming: Bool = false
    var counter: Float = 0.0 {
        didSet {
            DispatchQueue.main.async {
                self.timeLabel.text = String(format: "%.1f", self.counter)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initTimer()
    }

    @IBAction func resetButtonDidClick(_ sender: Any) {
        if isTiming {
            return;
        }
        counter = 0.0
    }
    
    @IBAction func startButtonDidClick(_ sender: Any) {
        if isTiming {
            return
        }
        isTiming = true
        timer!.resume()
    }
    
    @IBAction func pauseButtonDidClick(_ sender: Any) {
        if !isTiming {
            return
        }
        isTiming = false
        timer!.suspend()
    }
    
    private func initTimer() {
        let tempTimer = DispatchSource.makeTimerSource()
        tempTimer.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.milliseconds(100), leeway: DispatchTimeInterval.seconds(0));
        tempTimer.setEventHandler {
            self.counter = self.counter + 0.1
        }
        timer = tempTimer
    }
}

