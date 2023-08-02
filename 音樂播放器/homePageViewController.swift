//
//  homePageViewController.swift
//  音樂播放器
//
//  Created by Hydee Chen on 2023/7/27.
//

import UIKit
//載入AVFoundation函式庫(framework)
import AVFoundation


class homePageViewController: UIViewController {
    //拉view陰影的outlet
    @IBOutlet weak var shadowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //設定陰影的參數
        shadowView.layer.cornerRadius = CGFloat(80)
        shadowView.layer.shadowOpacity = Float(1)
        shadowView.layer.shadowRadius = CGFloat(20)
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
