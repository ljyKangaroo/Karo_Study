//
//  PlayVideoListVC.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/2/2.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class PlayVideoListVC: UIViewController {
    
    lazy var tableView:UITableView = UITableView()
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Video"
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.frame = self.view.bounds
    }

    private func setupUI() {
        self.view.addSubview(self.tableView)
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.delegate = (self as UITableViewDelegate)
        tableView.dataSource = (self as UITableViewDataSource)
        tableView.register(UINib.init(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
    }

}

extension PlayVideoListVC: UITableViewDelegate, UITableViewDataSource,VideoCellDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.viewdeoImageView.image = UIImage.init(named: video.image)
        cell.videoTitle.text = video.title
        cell.videoSource.text = video.source
        cell.delegate = self 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    func cellPlayAction() {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}
