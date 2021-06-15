//
//  SoundFile.swift
//  QuestionApp1
//
//  Created by 田川　裕隆 on 2021/06/11.
//

import Foundation
import AVFoundation

class SoundFile{
    var player:AVAudioPlayer?
    
    func playSound(fileName:String, extensionName:String){
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        } catch {
            print("エラーです！")
        }
    }
}
