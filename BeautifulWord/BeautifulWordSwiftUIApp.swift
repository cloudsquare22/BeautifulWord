//
//  BeautifulWordSwiftUIApp.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2023/02/27.
//  Copyright © 2023 shi-n. All rights reserved.
//

import SwiftUI

@main
struct BeautifulWordSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MusicData())
                .environmentObject(SettingData())
        }
    }
}
