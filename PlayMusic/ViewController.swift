//
//  ViewController.swift
//  PlayMusic
//
//  Created by Jimmy on 2020/10/19.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    var audio: AVAudioPlayer?
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var currentState: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        makeMusicButton(x: width * 0.2, y: height * 0.2, title: MusicName.classical.chineseName, music: MusicName.classical.englishName)
        makeMusicButton(x: width * 0.6, y: height * 0.2, title: MusicName.love.chineseName, music: MusicName.love.englishName)
        makeMusicButton(x: width * 0.2, y: height * 0.6, title: MusicName.village.chineseName, music: MusicName.village.englishName)
        makeMusicButton(x: width * 0.6, y: height * 0.6, title: MusicName.rock.chineseName, music: MusicName.rock.englishName)
        // Do any additional setup after loading the view.
    }
    @objc func playMusic(_ sender: ButtonParameter)
    {
        do {
            let url = Bundle.main.url(forResource:sender.musicName , withExtension: "mp3")
            try AVAudioSession.sharedInstance().setCategory(.playback)
            audio = try AVAudioPlayer(contentsOf: url!)
            if let audio = audio
            {
                if audio.prepareToPlay()
                {
                    currentState = !currentState
                    audio.play()
                }
            }
        }catch
        {
            print("something Error")
        }
    }
    func makeMusicButton(x:CGFloat, y:CGFloat, title: String , music: String)
    {
        let button = ButtonParameter()
        let width = view.frame.width
        button.frame = CGRect(x: x, y: y, width: width * 0.2, height: width * 0.2)
        button.backgroundColor = .yellow
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.musicName = music
        button.addTarget(self, action: #selector(playMusic(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
}





