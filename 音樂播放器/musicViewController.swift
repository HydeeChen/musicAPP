//
//  musicViewController.swift
//  音樂播放器
//
//  Created by Hydee Chen on 2023/7/27.
//

import UIKit
//載入AVFoundation函式庫(framework)
import AVFoundation

class musicViewController: UIViewController {
    
    
    //設定漸層的outlet
    @IBOutlet weak var backgroundView: UIImageView!
    //設定陰影的outlet
    @IBOutlet weak var shadowView: UIView!
    //設定專輯封面outlet
    @IBOutlet weak var musicImage: UIImageView!
    //設定歌名outlet Label
    @IBOutlet weak var musicName: UILabel!
    //設定歌手Label outlet
    @IBOutlet weak var singerLabel: UILabel!
    //設定音樂播放進度的slider
    @IBOutlet weak var musicSlider: UISlider!
    //拉音量調整的Slider
    @IBOutlet weak var volumeSlider: UISlider!
    //設定播放and暫停的按鈕outlet
    @IBOutlet weak var playAndPause: UIButton!
    //設定正在播放的音樂時間label
    @IBOutlet weak var currentTime: UILabel!
    //設定音樂總時間label
    @IBOutlet weak var totalTime: UILabel!
    
    
    
    //設定漸層的layer屬性
    let background = CAGradientLayer()
    //設定自定義紫色色碼
    let purple = UIColor(red: 143/255, green: 128/255, blue: 255/255, alpha: 1)
    //設定index起始值
    var index = 0
    
    //設定歌名型別
    var MusicInformations = [MusicData123]()
    let MusicInformation1 = MusicData123(songName: "golden_hour", SongNameLabel: "Golden Hour", Singer: "JVKE", picture: "goldenHour")
    let MusicInformation2 = MusicData123(songName:  "NIGHT_DANCER", SongNameLabel: "Night Dancer", Singer: "Imase", picture: "nightDancer")
    let MusicInformation3 = MusicData123(songName:  "Stay_With_Me", SongNameLabel: "Stay With Me", Singer: "松原みき", picture: "stayWithMe")
    
    
    //把型別 AVPlayer 存入常數 player，就可使用AVPlayer()裡的功能
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //設定backgroundvView的漸層顏色
        background.frame =  backgroundView.bounds
        background.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, purple.cgColor,]
        background.locations = [0.1, 0.3, 0.8]
        backgroundView.layer.addSublayer(background)
        
        //設定陰影
        shadowView.layer.cornerRadius = CGFloat(80)
        shadowView.layer.shadowOpacity = Float(1)
        shadowView.layer.shadowRadius = CGFloat(30)
        shadowView.layer.shadowColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        //設定畫面初始時，音量控制是隱藏
        volumeSlider.isHidden = true
        
        //將音樂資料包進去[]
        MusicInformations.append(MusicInformation1)
        MusicInformations.append(MusicInformation2)
        MusicInformations.append(MusicInformation3)
        
        //設定初始專輯畫面
        musicImage.image = UIImage(named: MusicInformations[0].picture)
        //設定初始歌名
        musicName.text = MusicInformations[0].SongNameLabel
        //設定初始歌手名稱
        singerLabel.text = MusicInformations[0].Singer
        //播放音樂
        //1.透過 Bundle.main 讀取程式本身的資料夾，找到音樂mp3檔的url路徑
        let fileUrl = Bundle.main.url(forResource: MusicInformations[index].songName, withExtension: "mp3")!
        //2.利用 AVPlayerItem 生成要播放的音樂
        let playerItem = AVPlayerItem(url: fileUrl)
        //3.設定 player 要播放的 AVPlayerItem
        player.replaceCurrentItem(with: playerItem)
        //4.開始播放
        player.play()
        
    }
    //音樂播放及暫停功能
    @IBAction func playAndPause(_ sender: UIButton) {
        if player.rate != 0 {
            //暫停播放
            player.pause()
            //button顯示播放圖示
            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            //button顯示播放圖示
            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    //設定播放下一首功能
    @IBAction func next(_ sender: Any) {
        //設定下一首的數學公式
        index = (index + 1)%MusicInformations.count
        //播放音樂
        let fileUrl = Bundle.main.url(forResource: MusicInformations[index].songName, withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        //設定初始專輯畫面
        musicImage.image = UIImage(named: MusicInformations[index].picture)
        //設定初始歌名
        musicName.text = MusicInformations[index].SongNameLabel
        //設定初始歌手名稱
        singerLabel.text = MusicInformations[index].Singer
        }
    
    //設定回到上一首功能
    @IBAction func pre(_ sender: Any) {
        //設定上一首的數學公式
        index = (index+MusicInformations.count-1)%MusicInformations.count
        //播放音樂
        let fileUrl = Bundle.main.url(forResource: MusicInformations[index].songName, withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        //設定初始專輯畫面
        musicImage.image = UIImage(named: MusicInformations[index].picture)
        //設定初始歌名
        musicName.text = MusicInformations[index].SongNameLabel
        //設定初始歌手名稱
        singerLabel.text = MusicInformations[index].Singer
    }
        //設定音樂隨機播放
    @IBAction func shuffle(_ sender: Any) {
        //設定順序shuffle
        MusicInformations.shuffle()
        
        //播放音樂
        let fileUrl = Bundle.main.url(forResource: MusicInformations[index].songName, withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        //設定初始專輯畫面
        musicImage.image = UIImage(named: MusicInformations[index].picture)
        //設定初始歌名
        musicName.text = MusicInformations[index].SongNameLabel
        //設定初始歌手名稱
        singerLabel.text = MusicInformations[index].Singer
    }
    //設定出現slider控制音量
    @IBAction func volumeChange(_ sender: Any) {
        volumeSlider.isHidden = false
    }
    //設定調整音量slider
    @IBAction func volumeSlider(_ sender: UISlider) {
        player.volume = sender.value
    }
    //設定點旁邊隱藏音量slider
    @IBAction func hideen(_ sender: Any) {
        volumeSlider.isHidden = true
    }
    
    
    
    //設定拉動slider控制音樂播放進度
    //musicSlider
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    }

