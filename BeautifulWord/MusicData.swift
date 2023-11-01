//
//  MusicData.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/03.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI
import MediaPlayer
import MusicKit

final class MusicData: ObservableObject  {
    @Published var lyrics:String = ""
    @Published var title:String = ""

    var player: MPMusicPlayerController! = MPMusicPlayerController.systemMusicPlayer
    let musicPlayer = SystemMusicPlayer.shared

    init() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(MusicData.changeMusic(_:)), name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: player)
        player.beginGeneratingPlaybackNotifications()
        getLyrics()
    }
    
    func next() {
//        player.skipToNextItem()
        Task {
            do {
                try await self.musicPlayer.skipToNextEntry()
            }
            catch {
                print(error.localizedDescription)
            }
        }
        getLyrics()
    }
    
    func previous() {
        player.skipToPreviousItem()
        Task {
            do {
                try await self.musicPlayer.skipToPreviousEntry()
            }
            catch {
                print(error.localizedDescription)
            }
        }
        getLyrics()
    }

    func getLyrics() {
        title = "No Title."
        lyrics = ""
//        title = "ただそれだけ"
//        lyrics = """
//        美しい空を見た 美しい花を見た
//        嬉しい事があった ただそれだけ
//
//        素敵な場所があった 素敵な人に会った
//        哀しい事があった ただそれだけ
//
//        どれも些細な出来事 何故か気になる今
//
//        伝えたい事がある 伝えたいこの時を
//
//        綺麗な月を見た 綺麗な鳥を見た
//        楽しい事があった ただそれだけ
//
//        素敵な歌があった 素敵な言葉があった
//        悲しい事があった ただそれだけ
//
//        どれも大切な出来事 何故か思える今
//
//        伝えたい人がいる 伝えたいこの時を
//        """
        if let now = player.nowPlayingItem {
            if let nowTitle = now.title {
                title = nowTitle
            }
            if let nowLyrics = now.lyrics {
                lyrics = nowLyrics
                print("player.nowPlayingItem.lyrics")
            }
            else if let assetURL = now.assetURL {
                let aVAsset = AVAsset.init(url: assetURL)
                if let nowLyrics = aVAsset.lyrics {
                    lyrics = nowLyrics
                    print("AVAsset.init.lyrics:\(assetURL)")
                }
            }
        }
        print(title)
    }

    @objc func changeMusic(_ notification:Notification?) {
        print("changeMusic")
        getLyrics()
    }
}
