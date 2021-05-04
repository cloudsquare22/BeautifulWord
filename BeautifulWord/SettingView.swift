//
//  SettingView.swift
//  BeautifulWord
//
//  Created by Shin Inaba on 2019/10/05.
//  Copyright © 2019 shi-n. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var settingData:SettingData

    var body: some View {
        List {
            Section(header: Text("OPERATION")) {
                SettingOperationView()
            }
            Section(header: Text("FONT")) {
                SettingFontView()
            }
            Section(header: Text("AUTO LOCK")) {
                SettingAutoLockView()
            }
            Section(header: Text("ABOUT")) {
                SettingAboutView()
            }
        }
//        .onDisappear() {
//            self.settingData.saveData()
//        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(MusicData()).environmentObject(SettingData())
    }
}
