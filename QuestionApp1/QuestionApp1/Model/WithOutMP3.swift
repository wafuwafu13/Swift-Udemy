//
//  WithOutMP3.swift
//  QuestionApp1
//
//  Created by 田川　裕隆 on 2021/06/11.
//

import Foundation

class WithOutMP3: SoundFile{
    
    override func playSound(fileName: String, extensionName: String) {
        if extensionName == "mp3"{
            print("このファイルは再生できません")
        }
        player?.stop()
    }
    
}
