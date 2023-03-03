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
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.largeTitle)
                .padding(EdgeInsets(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0))
        })
        .overlay(
            RoundedRectangle(cornerRadius: 64)
                .stroke(.blue, lineWidth: 1)
        )
        .padding(.top, 32.0)
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
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(MusicData()).environmentObject(SettingData())
    }
}
