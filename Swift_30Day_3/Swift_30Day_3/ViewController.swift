//
//  ViewController.swift
//  Swift_30Day_3
//
//  Created by ZhangYi on 2019/2/22.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var videoTableView: UITableView!
    let dataSource = [VideoSource(image: "videoScreenshot01",
                                  title: "Introduce 3DS Mario",
                                  source: "Youtube - 06:32"),
                      VideoSource(image: "videoScreenshot02",
                                  title: "Emoji Among Us",
                                  source: "Vimeo - 3:34"),
                      VideoSource(image: "videoScreenshot03",
                                  title: "Seals Documentary",
                                  source: "Vine - 00:06"),
                      VideoSource(image: "videoScreenshot04",
                                  title: "Adventure Time",
                                  source: "Youtube - 02:39"),
                      VideoSource(image: "videoScreenshot05",
                                  title: "Facebook HQ",
                                  source: "Facebook - 10:20"),
                      VideoSource(image: "videoScreenshot06",
                                  title: "Lijiang Lugu Lake",
                                  source: "Allen - 20:30")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        videoTableView.register(UINib.init(nibName: "videoCell", bundle: nil), forCellReuseIdentifier: "videoCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: videoCell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! videoCell
        weak var weakSelf = self
        cell.configVideoCell(dataSource[indexPath.row]) { (source) in
            let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
            guard path != nil, let strongSelf = weakSelf else {
                return
            }
            let player = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
            let playerVc = AVPlayerViewController.init()
            playerVc.player = player
            
            strongSelf.present(playerVc, animated: true, completion: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
